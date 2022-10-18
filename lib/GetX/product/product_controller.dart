import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';

class AddedProductController extends GetxController {
  List<Products> listProducts = <Products>[].obs();

  void addProducts(Products products) {
    listProducts.add(products);
    update();

    Get.snackbar("បានបន្ថែមទៅក្នុងកន្ត្រកជោគជ័យ", "អ្នកបានដាក់",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  removeProductController(String productName) {
    listProducts.removeAt(
        listProducts.indexWhere((element) => element.name == productName));
    update();
  }

  get products => listProducts;
}
