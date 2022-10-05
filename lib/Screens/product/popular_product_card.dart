import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularProductCard extends StatefulWidget {
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const PopularProductCard(
      {Key? key,
      this.widthFactor = 2.5,
      this.leftPosition = 5.0,
      this.isWishList = false})
      : super(key: key);

  @override
  State<PopularProductCard> createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    final double widthValue =
        MediaQuery.of(context).size.width / widget.widthFactor;
    return InkWell(
      child: SizedBox(
        height: 180,
        child: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Stack(
                    children: [
                      Container(
                        width: 170,
                        height: 100,
                        child: Image.network(
                          documentSnapshot['imageAsset'][0]['url'].toString(),
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
                          decoration:
                              BoxDecoration(color: Colors.black.withAlpha(50)),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: widget.leftPosition + 5,
                        child: Container(
                          width: widthValue - 10 - widget.leftPosition,
                          height: 80,
                          decoration:
                              BoxDecoration(color: Colors.black.withAlpha(50)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      documentSnapshot['name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      documentSnapshot['price'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
          },
        ),
      ),
    );
  }
}
