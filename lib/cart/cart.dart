import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/GetX/product/counter_product.dart';
import 'package:pharmacy_appnew_version/GetX/product/product_controller.dart';
import 'package:pharmacy_appnew_version/bottom/bottom_until.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';
import 'package:pharmacy_appnew_version/models/user/products_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom/custom_navbar.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int index = 4;
  AddedProductController productController = Get.put(AddedProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('កន្ត្រក'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, 4),
      body: GetBuilder<AddedProductController>(builder: (value) {
        return SizedBox(
          height: 600,
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: value.listProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(productController
                              .listProducts[index].imageAsset[0]['url']
                              .toString()),
                        ),
                        title: Text(productController.listProducts[index].name),
                        subtitle:
                            Text(productController.listProducts[index].price),
                        trailing: SizedBox(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  )),
                              Obx((() => Text('${productController.qty}'))),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    productController.removeProductController(
                                        productController
                                            .listProducts[index].name);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                  onPrimary: Colors.green, // Text Color (Foreground color)
                ),
                child: Text(
                  'ធ្វើការកម្មង',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
