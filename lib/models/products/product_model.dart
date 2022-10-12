import 'dart:convert';

import 'package:flutter/cupertino.dart';

Products productFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  String name;
  String discription;
  String subCategory;
  String mainCategory;
  String price;
  bool popular;
  List<dynamic> imageAsset;

  Products({
    required this.discription,
    required this.mainCategory,
    required this.name,
    required this.popular,
    required this.price,
    required this.subCategory,
    required this.imageAsset,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      discription: json["discription"],
      mainCategory: json["mainCategory"],
      name: json["name"],
      popular: json["popular"],
      price: json["price"].toString(),
      subCategory: json["subCategory"],
      imageAsset: json["imageAsset"]);

  Map<String, dynamic> toJson() => {
        "discription": discription,
        "mainCategory": mainCategory,
        "name": name,
        "popular": popular,
        "price": price,
        "subCategory": subCategory,
        "imageAsset": imageAsset,
      };
  void display() {
    print('Name:$name');
    print('Discription:$discription');
    print('Populor:$popular');
    // print(imageAsset[0]['url']);
  }
}
