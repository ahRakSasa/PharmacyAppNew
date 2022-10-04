import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GetImagePage extends StatefulWidget {
  String documentId;
  GetImagePage({Key? key, required this.documentId}) : super(key: key);

  @override
  State<GetImagePage> createState() => _GetImagePageState();
}

class _GetImagePageState extends State<GetImagePage> {
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

            Object img = data['imageAsset'][0]['url'];

            return ListTile(
              leading: CachedNetworkImage(
                  width: 195,
                  height: 100,
                  fit: BoxFit.fill,
                  imageUrl: img.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error)),
            );
          }
          return Text('loading...');
        }));
  }
}
