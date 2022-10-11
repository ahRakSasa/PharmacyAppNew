class Banner {
  late String discription;
  late String imageAsset;
  late DateTime timestamp;
  late String title;
  Banner(
      {required this.discription,
      required this.imageAsset,
      required this.timestamp,
      required this.title});
  Map<String, dynamic> toMap() {
    return {
      'discription': discription,
      'imageAsset': imageAsset,
      'timestamp': timestamp,
      'title': title,
    };
  }

  Banner.fromMap(Map<String, dynamic> res)
      : discription = res['discription'],
        imageAsset = res['imageAsset'],
        timestamp = res['title'];
}