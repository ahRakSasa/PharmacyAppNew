import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/Cart/cart_bloc.dart';
import '../blocs/WishList/wishlist_bloc.dart';
import '../model/model.dart';

class ProductCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageAsset,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 10 - leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${Product.products[0].price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
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
                                    .add(AddProduct(product));
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
                    isWishList
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {
                                final snackBar = SnackBar(
                                    content: Text('REMOVE FROM YOUR WISHLIST'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                context
                                    .read<WishlistBloc>()
                                    .add((RemoveProductFromWishList(product)));
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
          )
        ],
      ),
    );
  }
}
