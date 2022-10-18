// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
    Orders({
        required this.amount,
        required this.paymentMethod,
        required this.userInfo,
    });

    String amount;
    String paymentMethod;
    List<UserInfo> userInfo;

    factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        amount: json["amount"],
        paymentMethod: json["payment_method"],
        userInfo: List<UserInfo>.from(json["userInfo"].map((x) => UserInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "payment_method": paymentMethod,
        "userInfo": List<dynamic>.from(userInfo.map((x) => x.toJson())),
    };
}

class UserInfo {
    UserInfo({
        required this.address,
        required this.name,
        required this.phone,
        required this.uid,
    });

    String address;
    String name;
    String phone;
    String uid;

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        address: json["address"],
        name: json["name"],
        phone: json["phone"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "phone": phone,
        "uid": uid,
    };
}
