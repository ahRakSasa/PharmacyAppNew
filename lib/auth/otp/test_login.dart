// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:pharmacy_appnew_version/models/user/users_model.dart';

// class LoginTest extends StatefulWidget {
//   const LoginTest({super.key});

//   @override
//   State<LoginTest> createState() => _LoginTestState();
// }

// class _LoginTestState extends State<LoginTest> {
//   List<String> docsId = [];
//   Future<Users?> getProduct(String docId) async {
//     final docProduct =
//         FirebaseFirestore.instance.collection('users').doc(docId);
//     final snapshot = await docProduct.get();
//     if (snapshot.exists) {
//       return Users.fromJson(snapshot.data()!);
//     }
//     return Users.fromJson(snapshot.data()!);
//   }

//   Future getDocsID() async {
//     // await FirebaseFirestore.instance.collection('users').get().then((value) {
//     //   value.docs.forEach((DocumentSnapshot document) {
//     //     setState(() {
//     //       docsId.add(document.reference.id);
//     //     });
//     //   });
//     // });
//     var doc = await FirebaseFirestore.instance
//         .doc("users/uid");
//     doc.get().then((value) => print(value.data()));
//   }

//   var temDocsId;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     temDocsId = getDocsID();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: docsId.length,
//         itemBuilder: (context, index) {
//           return FutureBuilder(
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Center(
//                   child: Text('wrong'),
//                 );
//               } else if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               } else {
//                 final dataProduct = snapshot.data!;
//                 return dataProduct == null
//                     ? const Center(
//                         child: Text('No Products'),
//                       )
//                     : buildLoginBody(users: dataProduct as Users);
//               }
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget buildLoginBody({Users? users}) {
//     return SizedBox(
//       child: Column(
//         children: [
//           Text(users!.phoneNum.toString()),
//         ],
//       ),
//     );
//   }
// }
