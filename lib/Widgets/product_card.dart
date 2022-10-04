import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/controller/test_firebase/firebase_controller.dart';
import 'package:pharmacy_appnew_version/controller/product/get_data.dart';

import '../blocs/Cart/cart_bloc.dart';
import '../blocs/WishList/wishlist_bloc.dart';
import '../model/model.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5.0,
      this.isWishList = false})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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

  var firedata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firedata = getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final double widthValue =
        MediaQuery.of(context).size.width / widget.widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: widget.product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            child: Image.network(
              widget.product.imageAsset,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 60,
            left: widget.leftPosition + 5,
            child: Container(
              // width: widthValue - widget.leftPosition,
              width: widthValue - 10 - widget.leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 60,
            left: widget.leftPosition + 5,
            child: Container(
              width: widthValue - 10 - widget.leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              child: Row(
                children: [
                  // Expanded(
                  //   flex: 2,
                  //   child: FutureBuilder(
                  //     future: firedata,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasError) {
                  //         return const Center(
                  //           child: Icon(
                  //             Icons.info,
                  //             size: 30,
                  //             color: Colors.red,
                  //           ),
                  //         );
                  //       }
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return const Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       }
                  //       return Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             //GetDataPage(documentId:docId[index].toString() ),
                  //             docId[0],
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyText1!
                  //                 .copyWith(color: Colors.white),
                  //           ),
                  //           Text(
                  //             '\$${Product.products[0].price}',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyText1!
                  //                 .copyWith(color: Colors.white),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
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
                              final snackBar =
                                  SnackBar(content: Text('ADD TO YOUR CART'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              context
                                  .read<CartBloc>()
                                  .add(AddProduct(widget.product));
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
                                  content: Text('REMOVE FROM YOUR WISHLIST'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              context.read<WishlistBloc>().add(
                                  (RemoveProductFromWishList(widget.product)));
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.white,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
