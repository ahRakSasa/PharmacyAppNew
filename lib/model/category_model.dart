
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String imageAsset;
  final String title;

  const Category({
    required this.title,
    required this.imageAsset,
  });

  @override
  List<Object?> get props => [
        imageAsset,
        title,
      ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      imageAsset: snap['imageAsset'],
      title: snap['title'],
    );
    return category;
  }

  static List<Category> categories = [
    Category(
      imageAsset:
          "https://www.verywellfamily.com/thmb/qi4u6lEOx156fiWdnPuOQAf5Gb4=/3000x2001/filters:fill(D7DFF5,1)/VWH-smartypants-childrensvitamins-multiandomega3s-90gummies-ardito653-660d2ae6cd524f068bdde019101651df.jpg",
      title: "Vitamin",
    ),
    Category(
      imageAsset:
          "https://wealzin.com.bd/wp-content/uploads/2022/06/centrum-men-multimineral-with-vitamin-d3-vitamins-120-tablets-300x300.jpg",
      title: "Skincare",
    ),
    Category(
      imageAsset:
          "https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/bp-wellness-centrum/en_US/sliced-images/global/products/Bottle-of-Centrum-Liquid-multivitamin.jpg?auto=format",
      title: "Babycare",
    ),
    Category(
      imageAsset:
          "https://www.pharmez.ph/wp-content/uploads/2020/07/Centrum-Silver-Advance.jpg",
      title: "Pills",
    ),
  ];
}
