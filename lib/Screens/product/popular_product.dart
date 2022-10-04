import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/controller/product/get_image_firebase_controller.dart';

class PopularProductGet extends StatefulWidget {
  const PopularProductGet({super.key});

  @override
  State<PopularProductGet> createState() => _PopularProductGetState();
}

class _PopularProductGetState extends State<PopularProductGet> {
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
    return Scaffold(
      body: ListView.builder(
        itemCount: docId.length,
        itemBuilder: (context, index) {
          return Container(child: GetImagePage(documentId: docId[index]));
        },
      ),
    );
  }
}
