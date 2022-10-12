import 'dart:convert';
import 'package:flutter/cupertino.dart';

Branches branchFromJson(String str) => Branches.fromJson(json.decode(str));

String branchesToJson(Branches data) => json.encode(data.toJson());

class Branches {
  List<dynamic> branch;

  Branches({required this.branch});

  factory Branches.fromJson(Map<String, dynamic> json) =>
      Branches(branch: ["branch"]);

  Map<String, dynamic> toJson() => {
        "branch": branch,
      };
}
