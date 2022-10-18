import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/GetX/product/product_controller.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  AddedProductController productController = Get.put(AddedProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('កន្ត្រក'),
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<AddedProductController>(builder: (value) {
        return ListView.builder(
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
                subtitle: Text(productController.listProducts[index].price),
                trailing: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.add_circle,
                      //       color: Colors.green,
                      //     )),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.remove_circle,
                      //       color: Colors.green,
                      //     )),
                      IconButton(
                          onPressed: () {
                            productController.removeProductController(
                                productController.listProducts[index].name);
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
        );
      }),
    );
  }
}
