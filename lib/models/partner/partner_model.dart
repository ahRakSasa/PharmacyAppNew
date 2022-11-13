// To parse this JSON data, do
//
//     final partners = partnersFromJson(jsonString);

import 'dart:convert';

Partners partnersFromJson(String str) => Partners.fromJson(json.decode(str));

String partnersToJson(Partners data) => json.encode(data.toJson());

class Partners {
    Partners({
        required this.partner,
    });

    List<Partner> partner;

    factory Partners.fromJson(Map<String, dynamic> json) => Partners(
        partner: List<Partner>.from(json["partner"].map((x) => Partner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "partner": List<dynamic>.from(partner.map((x) => x.toJson())),
    };
}

class Partner {
    Partner({
        required this.imageAsset,
    });

    String imageAsset;

    factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        imageAsset: json["imageAsset"],
    );

    Map<String, dynamic> toJson() => {
        "imageAsset": imageAsset,
    };
}
