import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Product extends Equatable {
  final String imageAsset;
  final String name;
  final double price;
  final bool popular;
  final String mainCategory;
  final String subCategory;
  final String discription;

  const Product({
    required this.imageAsset,
    required this.name,
    required this.price,
    required this.discription,
    required this.mainCategory,
    required this.popular,
    required this.subCategory,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      imageAsset: snap['imageAsset'],
      name: snap['name'],
      price: snap['price'],
      discription: snap['discription'],
      mainCategory: snap['mainCategory'],
      popular: snap['popular'],
      subCategory: snap['subCategory'],
    );
    return product;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        imageAsset,
        name,
        price,
        mainCategory,
        subCategory,
        discription,
        popular
      ];

  static List<Product> products = [
    // ignore: prefer_const_constructors
    Product(
        name: "Vitamin #1",
        price: 2.99,
        discription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        subCategory: '',
        mainCategory: '',
        popular: true,
        //timestamp: Timestamp.now(),
        imageAsset:
            "http://cdn.shopify.com/s/files/1/0265/3034/9153/products/Shopbilder_VitaminStack_1200x1200.jpg?v=1633617809"),

    Product(
        name: "Vitamin #1",
        price: 2.99,
        discription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        subCategory: '',
        mainCategory: '',
        popular: true,
        //timestamp: Timestamp.now(),
        imageAsset:
            "http://cdn.shopify.com/s/files/1/0265/3034/9153/products/Shopbilder_VitaminStack_1200x1200.jpg?v=1633617809"),
  ];
}


