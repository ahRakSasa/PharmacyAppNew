import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/GetX/product/product_controller.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';
import 'package:pharmacy_appnew_version/models/user/products_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GetX/favourite/favourite_controller.dart';
import '../bottom/custom_navbar.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  AddedFavouriteProductController favouriteProductController =
      Get.put(AddedFavouriteProductController());
 Future<void> saveData() async{
   final prefs = await SharedPreferences.getInstance();
   setState(() {
     
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ចូលចិត្ត'),
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<AddedFavouriteProductController>(builder: (value) {
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
                          backgroundImage: NetworkImage(
                              favouriteProductController
                                  .listProducts[index].imageAsset[0]['url']
                                  .toString()),
                        ),
                        title: Text(favouriteProductController
                            .listProducts[index].name),
                        subtitle: Text(favouriteProductController
                            .listProducts[index].price),
                        trailing: SizedBox(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    favouriteProductController
                                        .removeFavouriteProductController(
                                            favouriteProductController
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
