import 'package:get/get.dart';
import 'package:pharmacy_appnew_version/models/products/product_model.dart';

class AddedFavouriteProductController extends GetxController {
  List<Products> listProducts = <Products>[].obs();
 

  void addFavouriteProducts(Products products) async {
    listProducts.add(products);
    update();

    Get.snackbar("បានបន្ថែមទៅក្នុងការចូលចិត្តជោគជ័យ", "អ្នកបានដាក់",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  removeFavouriteProductController(String productName) {
    listProducts.removeAt(
        listProducts.indexWhere((element) => element.name == productName));
    update();
  }

  get products => listProducts;
}
