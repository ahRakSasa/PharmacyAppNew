import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(),
      bottomNavigationBar: CustomNavigationBarPage(),
      // body: GridView.builder(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2, childAspectRatio: 1.15),
      //   itemCount: categoryProducts.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Center(
      //       child: ProductCard(
      //         product: categoryProducts[index],
      //         widthFactor: 2.2,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
