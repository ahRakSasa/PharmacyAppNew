import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pharmacy_appnew_version/Screens/home/hero_carousel_cart.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
import 'package:pharmacy_appnew_version/Screens/place/branches.dart';
import 'package:pharmacy_appnew_version/Screens/product/Test_Products/test_products.dart';
import 'package:pharmacy_appnew_version/Screens/product/screen_product_simple.dart';
import 'package:pharmacy_appnew_version/Screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacy_appnew_version/auth/otp/register.dart';
import 'package:pharmacy_appnew_version/auth/otp/test_login.dart';
import 'package:pharmacy_appnew_version/check_out/check_out.dart';
import 'package:pharmacy_appnew_version/check_out/order_confimation.dart';
import 'package:pharmacy_appnew_version/check_out/order_page.dart';
import 'package:pharmacy_appnew_version/profile/edit_acc.dart';
import 'package:pharmacy_appnew_version/setting/About_Us/home_screen_about.dart';

import 'package:pharmacy_appnew_version/setting/setting_screen.dart';
import 'Screens/product/medical/medical_product.dart';
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
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
