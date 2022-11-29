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
      body: GetBuilder<AddedProductController>(
          init: productController,
          builder: (value) {
            return SizedBox(
              height: 600,
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: productController.listProducts.length,
                      itemBuilder: (context, index) {
                        var pro = productController.listProducts[index];
                        var qty = productController.listQty[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  pro.imageAsset[0]['url'].toString()),
                            ),
                            title: Text(pro.name),
                            subtitle: Text(pro.price),
                            trailing: SizedBox(
                              width: 160,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        productController.decrementQty(index);
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.green,
                                      )),
                                  Text('$qty'),
                                  IconButton(
                                      onPressed: () {
                                        productController.incrementQty(index);
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        productController
                                            .removeProductController(
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
                ],
              ),
            );
          }),
    );
  }
}
