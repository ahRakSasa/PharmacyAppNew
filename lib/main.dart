import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Screens/home/hero_carousel_cart.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
import 'package:pharmacy_appnew_version/Screens/place/branches.dart';
import 'package:pharmacy_appnew_version/Screens/product/popular_product_card.dart';
import 'package:pharmacy_appnew_version/Screens/screens.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:pharmacy_appnew_version/sample_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
