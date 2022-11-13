// To parse this JSON data, do
//
//     final banners = bannersFromJson(jsonString);

import 'dart:convert';

Banners bannersFromJson(String str) => Banners.fromJson(json.decode(str));

String bannersToJson(Banners data) => json.encode(data.toJson());

class Banners {
    Banners({
        required this.banner,
    });

    List<Banner> banner;

    factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    };
}

class Banner {
    Banner({
        required this.discription,
        required this.imageAsset,
        required this.title,
    });

    String discription;
    String imageAsset;
    String title;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        discription: json["discription"],
        imageAsset: json["imageAsset"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "discription": discription,
        "imageAsset": imageAsset,
        "title": title,
    };
}
