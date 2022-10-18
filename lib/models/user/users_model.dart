// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        required this.address,
        required this.name,
        required this.email,
        required this.phoneNum,
    });

    String address;
    String name;
    String email;
    String phoneNum;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        address: json["address"],
        name: json["name"],
        email: json["email"],
        phoneNum: json["phoneNum"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "email": email,
        "phoneNum": phoneNum,
    };
}
