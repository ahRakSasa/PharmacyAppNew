// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.address,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phoneNum,
  });

  String address;
  String firstname;
  String lastname;
  String email;
  String phoneNum;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        address: json["address"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phoneNum: json["phoneNum"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "firstname": firstname,
        "lastname":lastname,
        "email": email,
        "phoneNum": phoneNum,
      };
}
