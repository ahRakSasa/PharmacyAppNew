import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew_version/model/category_model.dart';
import 'package:pharmacy_appnew_version/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore.collection('banner').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
