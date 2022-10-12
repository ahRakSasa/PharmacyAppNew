import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';

class AddedProductController extends GetxController {
  var _products = {}.obs;

  void addProducts(Products products) {
    if (_products.containsKey(products)) {
      _products[products] += 1;
    } else {
      _products[products] = 1;
    }
    Get.snackbar("បានបន្ថែមទៅក្នុងកន្ត្រកជោគជ័យ", "អ្នកបានដាក់",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  void removeProductController(Products products) {
    if (_products.containsKey(products) && _products[products] == 1) {
      _products.removeWhere((key, value) => key == products);
    } else {
      _products[products] -= 1;
    }
  }

  get products => _products;
}
