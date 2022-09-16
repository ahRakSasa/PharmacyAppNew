import 'package:pharmacy_appnew_version/model/category_model.dart';

abstract class BaseProductRepository {
  Stream<List<Category>> getAllCategories();
}
