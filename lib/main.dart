// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:pharmacy_appnew_version/Screens/home/hero_carousel_cart.dart';
// import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
// import 'package:pharmacy_appnew_version/Screens/place/branches.dart';
// import 'package:pharmacy_appnew_version/Screens/product/product_simple.dart';
// import 'package:pharmacy_appnew_version/Screens/screens.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:pharmacy_appnew_version/auth/otp/otp_auth.dart';
// import 'package:pharmacy_appnew_version/auth/test_otp/register.dart';
// import 'package:pharmacy_appnew_version/setting/About_Us/home_screen_about.dart';
// import 'package:pharmacy_appnew_version/setting/edit_person/person_screen.dart';
// import 'package:pharmacy_appnew_version/setting/setting_screen.dart';
// import 'firebase_options.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

import 'dart:core';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // You should have the Functions Emulator running locally to use it
  // https://firebase.google.com/docs/functions/local-emulator
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

Future<void> writeMessage() async {
  HttpsCallable callable =
      await FirebaseFunctions.instance.httpsCallable('createUser');
  try {
    final resp = await callable.call(<String, dynamic>{
      'address': 'ihijlkjl',
      'phone': '+856265',
      'email': 'hello@gmail.com',
      'firstname': 'boi',
      'lastname': 'ko',
      'uid': '021',
    });
    print("result: ${resp.data}");
  } on FirebaseException catch (error) {
    print(error.message);
  }
}

class _MyAppState extends State<MyApp> {
  List users = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Functions Example'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${users[index]}'),
              );
            },
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton.extended(
            onPressed: () {
              writeMessage();
              //print('object');
            },
            label: const Text('Call Function'),
            icon: const Icon(Icons.cloud),
            backgroundColor: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}

