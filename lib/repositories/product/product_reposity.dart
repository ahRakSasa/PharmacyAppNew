import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/model.dart';
import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  List<Product> listProduct = [];
  List<String> docId = [];

  Future getAllProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((value) => value.docs.forEach((element) {
              print('DocId:${element.reference.id}');
              docId.add(element.reference.id);
            }));
  }


  // @override
  // Stream<List<Product>> getAllProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     //print(snapshot);
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   });
  // }

  // Future<void> main() async {
  //   var myReadData = await getAllProducts();
  //   print(myReadData);
  // }

  // create({required String name, required String price}) {}
}
