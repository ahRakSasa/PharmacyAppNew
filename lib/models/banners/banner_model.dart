import 'dart:convert';

Banners bannerFromJson(String str) => Banners.fromJson(json.decode(str));

String bannersToJson(Banners data) => json.encode(data.toJson());

class Banners {
  late String discription;
  late String imageAsset;
  late String title;
  Banners(
      {required this.discription,
      required this.imageAsset,
      required this.title});

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
      discription: json["discription"],
      imageAsset: json["imageAsset"],
      title: json["title"]);

  Map<String, dynamic> toJson() => {
        'title': title,
        'discription': discription,
        'imageAsset': imageAsset,
      };
}
