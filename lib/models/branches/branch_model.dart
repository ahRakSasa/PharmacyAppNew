// To parse this JSON data, do
//
//     final branch = branchFromJson(jsonString);

import 'dart:convert';

Branch branchFromJson(String str) => Branch.fromJson(json.decode(str));

String branchToJson(Branch data) => json.encode(data.toJson());

class Branch {
  Branch({
    required this.branch,
  });

  List<BranchElement> branch;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branch: List<BranchElement>.from(
            json["branch"].map((x) => BranchElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "branch": List<dynamic>.from(branch.map((x) => x.toJson())),
      };
}

class BranchElement {
  BranchElement({
    required this.address,
    required this.phoneNum,
    required this.googleAddress,
    required this.imageAsset,
    required this.province,
  });

  String address;
  String phoneNum;
  String googleAddress;
  String imageAsset;
  String province;

  factory BranchElement.fromJson(Map<String, dynamic> json) => BranchElement(
        address: json["address"],
        phoneNum: json["phoneNum"],
        googleAddress: json["googleAddress"],
        imageAsset: json["imageAsset"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "phoneNum": phoneNum,
        "googleAddress": googleAddress,
        "imageAsset": imageAsset,
        "province": province,
      };
}
