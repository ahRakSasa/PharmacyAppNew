import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/controller/test_firebase/firebase_controller.dart';
import 'package:pharmacy_appnew_version/controller/product/get_data.dart';

import '../Screens/product/product_screen.dart';
import '../blocs/Cart/cart_bloc.dart';
import '../blocs/WishList/wishlist_bloc.dart';
import '../controller/product/get_image_firebase_controller.dart';
import '../model/model.dart';

class ProductCarousel extends StatefulWidget {
  final List<Product> products;
  //final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCarousel({
    Key? key,
    //required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5.0,
    this.isWishList = false,
    required this.products,
  }) : super(key: key);

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  List<String> docId = [];

  getAllProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docId.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
    print(docId);
  }

  @override
  Widget build(BuildContext context) {
    final double widthValue =
        MediaQuery.of(context).size.width / widget.widthFactor;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: docId.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductScreen(product: Product.products[index]),
                  ));
            },
            child: Stack(
              children: [
                Container(
                  width: widthValue + 70,
                  height: widthValue + 80,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  child: GetImagePage(documentId: docId[index]),
                ),
                Positioned(
                  top: 118,
                  left: widget.leftPosition + 5,
                  child: Container(
                    width: 227,
                    // width: widthValue - 10 - widget.leftPosition,
                    height: 50,
                    decoration:
                        BoxDecoration(color: Colors.black.withAlpha(50)),
                    child: Row(
                      children: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is CartLoaded) {
                              return Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    final snackBar = SnackBar(
                                        content: Text('ADD TO YOUR CART'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    // context
                                    //     .read<CartBloc>()
                                    //     .add(AddProduct(widget.product),);
                                  },
                                  icon: Icon(Icons.add_circle),
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return Text('Something went wrong');
                            }
                          },
                        ),
                        widget.isWishList
                            ? Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    final snackBar = SnackBar(
                                        content:
                                            Text('REMOVE FROM YOUR WISHLIST'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    // context.read<WishlistBloc>().add(
                                    //     (RemoveProductFromWishList(
                                    //         widget.product)));
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
