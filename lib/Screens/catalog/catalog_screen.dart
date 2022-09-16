import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/model/category_model.dart';
import 'package:pharmacy_appnew_version/model/model.dart';

import '../../Widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(
        category: category,
      ),
    );
  }

  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.mainCategory == category.title)
        .toList();
    return Scaffold(
      appBar: CustomAppBarPage(title: category.title),
      bottomNavigationBar: CustomNavigationBarPage(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          }),
    );
  }
}
