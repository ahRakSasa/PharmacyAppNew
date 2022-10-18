// To parse this JSON data, do
//
//     final productOrderList = productOrderListFromJson(jsonString);

import 'dart:convert';

ProductOrderList productOrderListFromJson(String str) => ProductOrderList.fromJson(json.decode(str));

String productOrderListToJson(ProductOrderList data) => json.encode(data.toJson());

class ProductOrderList {
    ProductOrderList({
        required this.status,
        required this.trackingNumber,
        required this.products,
    });

    String status;
    String trackingNumber;
    List<Product> products;

    factory ProductOrderList.fromJson(Map<String, dynamic> json) => ProductOrderList(
        status: json["status"],
        trackingNumber: json["tracking_number"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "tracking_number": trackingNumber,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.discription,
        required this.id,
        required this.img,
        required this.price,
        required this.quantity,
        required this.title,
    });

    String discription;
    String id;
    String img;
    String price;
    String quantity;
    String title;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        discription: json["discription"],
        id: json["id"],
        img: json["img"],
        price: json["price"],
        quantity: json["quantity"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "discription": discription,
        "id": id,
        "img": img,
        "price": price,
        "quantity": quantity,
        "title": title,
    };
}
