import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetBannerPage extends StatefulWidget {
  String bannerId;
  GetBannerPage({Key? key, required this.bannerId}) : super(key: key);

  @override
  State<GetBannerPage> createState() => _GetBannerPageState();
}

class _GetBannerPageState extends State<GetBannerPage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference banners =
        FirebaseFirestore.instance.collection('banner');

    return FutureBuilder<DocumentSnapshot>(
        future: banners.doc(widget.bannerId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Image.network(
              fit: BoxFit.cover,
              width: 1000.0,
              data['imageAsset'].toString(),
            );
            // return Text(
            //     data['name'].toString() + '\n' + data['price'].toString());
          }
          return Text('loading...');
        }));
  }
}
