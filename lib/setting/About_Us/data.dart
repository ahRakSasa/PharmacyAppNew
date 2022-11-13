class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: 'ក្រុមហ៊ុន',
      iconImage: 'assets/images1/boss1.jpg',
      description:
          "ឱសថស្ថាន យឹង មាន 10 សាខា នៅខេត្តសៀមរាប បន្ទាយមានជ័យ និងបាត់ដំបង។ គោលដៅរបស់យើងគឺនាំយកឱសថស្ថានរបស់យើងនៅទូទាំងប្រទេសដើម្បីដោះស្រាយបញ្ហាសុខភាពរបស់ប្រជាជនដោយផ្តោតលើឱសថដែលអាចទុកចិត្តបាន និងក្រមសីលធម៌វិជ្ជាជីវៈខ្ពស់ជាមួយនឹងក្រុមដែលមានការបណ្តុះបណ្តាលយ៉ាងល្អ។",
      images: [
        'assets/images1/boss3.jpg',
        'assets/images1/boss4.jpg',
      ]),
  PlanetInfo(2,
      name: 'ក្រុមហ៊ុន',
      iconImage: 'assets/images1/boss2.jpg',
      description:
          "ឱសថស្ថាន យឹង មាន 10 សាខា នៅខេត្តសៀមរាប បន្ទាយមានជ័យ និងបាត់ដំបង។ គោលដៅរបស់យើងគឺនាំយកឱសថស្ថានរបស់យើងនៅទូទាំងប្រទេសដើម្បីដោះស្រាយបញ្ហាសុខភាពរបស់ប្រជាជនដោយផ្តោតលើឱសថដែលអាចទុកចិត្តបាន និងក្រមសីលធម៌វិជ្ជាជីវៈខ្ពស់ជាមួយនឹងក្រុមដែលមានការបណ្តុះបណ្តាលយ៉ាងល្អ។",
      images: [
        'assets/images1/boss3.jpg',
        'assets/images1/boss4.jpg',
      ]),
];
