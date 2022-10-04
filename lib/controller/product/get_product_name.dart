import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataNamePage extends StatefulWidget {
  String documentId;
  GetDataNamePage({Key? key, required this.documentId}) : super(key: key);

  @override
  State<GetDataNamePage> createState() => _GetDataNamePageState();
}

class _GetDataNamePageState extends State<GetDataNamePage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
        future: products.doc(widget.documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(data['name'].toString());
          }
          return Text('loading...');
        }));
  }
}
