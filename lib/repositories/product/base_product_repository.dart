import 'package:pharmacy_appnew_version/model/category_model.dart';
import 'package:pharmacy_appnew_version/model/model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
