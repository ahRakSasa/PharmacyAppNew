import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:developer' as dev;
import 'package:pharmacy_appnew_version/models/products/product_model.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  CollectionReference productsData =
      FirebaseFirestore.instance.collection('products');
  String searchProduct = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 50,
          child: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search product',
                suffixIcon: Icon(Icons.search)),
            onChanged: (value) {
              setState(() {
                searchProduct = value;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder(
        stream: (searchProduct == '' || searchProduct.isEmpty)
            ? productsData.snapshots()
            : FirebaseFirestore.instance
                .collection('products')
                .where(
                  "name",
                  isEqualTo: searchProduct,
                )
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Icon(Icons.info));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount:snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var pro = snapshot.data!.docs[index];
                Products p = Products(
                    discription: pro['discription'],
                    mainCategory: pro['mainCategory'],
                    name: pro['name'],
                    popular: pro['popular'],
                    price: pro['price'].toString(),
                    subCategory: pro['subCategory'],
                    imageAsset: pro['imageAsset']);

                return Card(
                  child: ListTile(
                    leading: Image.network(p.imageAsset[0]['url']),
                    title: Text(p.name),
                    trailing: Text(p.mainCategory),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
