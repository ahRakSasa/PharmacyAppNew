import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';

class AddedProductController extends GetxController {
  List<Products> listProducts = <Products>[].obs();
  List<int> listQty = <int>[].obs();
  // List<double> listTotal = <double>[].obs();

  void addProducts(Products products) async {
    if (listProducts == []) {
      listProducts.add(products);
      listQty.add(1);
      Get.snackbar("បានបន្ថែមទៅក្នុងកន្ត្រកជោគជ័យ", "អ្នកបានដាក់",
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
    } else {
      if (listProducts.every((element) =>
          element.name.toLowerCase() != products.name.toLowerCase())) {
        listProducts.add(products);
        listQty.add(1);
        Get.snackbar("បានបន្ថែមទៅក្នុងកន្ត្រកជោគជ័យ", "អ្នកបានដាក់",
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
      } else {
        Get.snackbar("មានក្នុងកន្រ្តករួចហើយ", "អ្នកបានដាក់",
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
      }
    }

    update();
  }

  incrementQty(int index, {int qty = 1}) {
    listQty[index] += qty;

    update();
    print(listQty[index]);
  }

  decrementQty(int index, {int qty = 1}) {
    if (listQty[index] <= 1) {
      listQty[index] = 1;
    } else {
      listQty[index] -= qty;
    }
    update();
  }

  removeProductController(String productName) {
    listProducts.removeAt(
        listProducts.indexWhere((element) => element.name == productName));
    update();
  }

  get products => listProducts;
}
