import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Screens/product/popular_product_card.dart';

import '../../Widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen();

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          InkWell(
            child: const Icon(
              Icons.share,
              color: Colors.black,
              size: 30,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PopularProductCard()));
            },
          ),
          IconButton(
            onPressed: () {
              final snackBar =
                  SnackBar(content: Text('Added to your WishList!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.black, // Background color
              onPrimary: Colors.green, // Text Color (Foreground color)
            ),
            child: Text(
              'ADD TO CARD',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: 600,
        child: StreamBuilder(
            stream: _products.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Column(
                      children: [
                        // CarouselSlider.builder(
                        //   itemCount: streamSnapshot.data!.docs.length,
                        //   itemBuilder: (context, index, realIndex) {
                        //     final DocumentSnapshot documentSnapshot =
                        //         streamSnapshot.data!.docs[index];
                        //     return ClipRRect(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(5.0)),
                        //       child: Stack(
                        //         children: <Widget>[
                        //           Image.network(
                        //               documentSnapshot['imageAsset'][0]['url']
                        //                   .toString(),
                        //               fit: BoxFit.cover,
                        //               width: 300.0),
                        //           Positioned(
                        //             bottom: 0.0,
                        //             left: 0.0,
                        //             right: 0.0,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 gradient: LinearGradient(
                        //                   colors: [
                        //                     Color.fromARGB(200, 0, 0, 0),
                        //                     Color.fromARGB(0, 0, 0, 0)
                        //                   ],
                        //                   begin: Alignment.bottomCenter,
                        //                   end: Alignment.topCenter,
                        //                 ),
                        //               ),
                        //               padding: EdgeInsets.symmetric(
                        //                   vertical: 10.0, horizontal: 10.0),
                        //               child: Text(
                        //                 documentSnapshot['title'],
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headline6!
                        //                     .copyWith(color: Colors.white),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   options: CarouselOptions(
                        //     height: 400,
                        //     aspectRatio: 16 / 9,
                        //     viewportFraction: 0.8,
                        //     initialPage: 0,
                        //     enableInfiniteScroll: true,
                        //     reverse: false,
                        //     autoPlay: true,
                        //     autoPlayInterval: Duration(seconds: 3),
                        //     autoPlayAnimationDuration:
                        //         Duration(milliseconds: 800),
                        //     autoPlayCurve: Curves.fastOutSlowIn,
                        //     enlargeCenterPage: true,
                        //     scrollDirection: Axis.horizontal,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                color: Colors.black.withAlpha(50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      documentSnapshot.id[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      documentSnapshot['price'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text(
                              'Product Information',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            children: [
                              ListTile(
                                  // title: Text(
                                  //   widget.product.discription,
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodyText2!
                                  //       .copyWith(color: Colors.black),
                                  // ),
                                  )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text(
                              'Delivery Address',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            children: [
                              ListTile(
                                  // title: Text(
                                  //   widget.product.discription,
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodyText2!
                                  //       .copyWith(color: Colors.black),
                                  // ),
                                  )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
