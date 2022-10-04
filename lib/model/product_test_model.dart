import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/product/get_data.dart';

class ProductModelPage extends StatefulWidget {
  const ProductModelPage({super.key});

  @override
  State<ProductModelPage> createState() => _ProductModelPageState();
}

class _ProductModelPageState extends State<ProductModelPage> {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: docId.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 150,
                        color: Colors.amber,
                        margin: EdgeInsets.all(10),
                        child: GetDataPage(documentId: docId[index]));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
