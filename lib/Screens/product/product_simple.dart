import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/detail/detail.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';

class SimpleProductPage extends StatefulWidget {
  const SimpleProductPage({Key? key}) : super(key: key);

  @override
  State<SimpleProductPage> createState() => _SimpleProductPageState();
}

class _SimpleProductPageState extends State<SimpleProductPage> {
  List<String> docsId = [];
  Future<Products?> getProduct(String docId) async {
    final docProduct =
        FirebaseFirestore.instance.collection('products').doc(docId);
    final snapshot = await docProduct.get();
    if (snapshot.exists) {
      return Products.fromJson(snapshot.data()!);
    }
    return Products.fromJson(snapshot.data()!);
  }

  Future getDocsID() async {
    await FirebaseFirestore.instance.collection('products').get().then((value) {
      value.docs.forEach((DocumentSnapshot document) {
        setState(() {
          docsId.add(document.reference.id);
        });
      });
    });
  }

  var temDocsId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temDocsId = getDocsID();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: docsId.length,
          itemBuilder: (context, index) {
            return FutureBuilder(
              future: getProduct(docsId[index]),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('wrong'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  final dataProduct = snapshot.data!;

                  return dataProduct == null
                      ? const Center(
                          child: Text('No Products'),
                        )
                      : buildViewProduct(product: dataProduct as Products);
                }
              },
            );
          },
        ));
  }

  Widget buildViewProduct({Products? product}) {
    return product!.popular == false
        ? InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailScreen(products: product);
                  },
                ),
              );
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: Container(
                        height: 150,
                        child: AspectRatio(
                          aspectRatio: 10 / 9, //aspect ratio for Image
                          child: Image(
                            image: NetworkImage(product.imageAsset[0]['url']),
                            fit: BoxFit.cover,
                            height: 150, //fill type of image inside aspectRatio
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Container(
                          // width: widthValue - widget.leftPosition,
                          width: 160,
                          height: 50,
                          decoration:
                              BoxDecoration(color: Colors.black.withAlpha(90)),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
