// import 'package:cloud_firestore/cloud_firestore.dart';

// List<String> docId = [];

// class FirebaseController {
//   Future<List<String>> getAllProducts() async {
//     await FirebaseFirestore.instance
//         .collection('products')
//         .get()
//         .then((value) => value.docs.forEach((element) {
//               print('DocId:${element.reference.id}');
//               docId.add(element.reference.id);
//             }));
//     return docId;
//   }
// }

