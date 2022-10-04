import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/controller/product/get_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: Text("Horizontal & Vertical ListView"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Stack(
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
      ),
    );
  }
}
