import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../detail/detail.dart';
import 'popular_product_mainpage.dart';

class PopularProductCalling extends StatefulWidget {
  const PopularProductCalling({super.key});

  @override
  State<PopularProductCalling> createState() => _PopularProductCallingState();
}

class _PopularProductCallingState extends State<PopularProductCalling> {
  List<String> docId = [];

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  getProducDetail() async {
    await FirebaseFirestore.instance.collection('products').get().then((value) {
      value.docs.forEach((element) {
        docId.add(element.reference.id);
        print('productDocsID:${element.reference.id}');
      });
    });
  }

  var firedata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firedata = getProducDetail();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: firedata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Icon(
                Icons.info,
                size: 30,
                color: Colors.red,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: docId.length,
            itemBuilder: (context, index) {
              return PopularProductPage(documentId: docId[index]);
            },
          );
        },
      ),
    );
  }
}
