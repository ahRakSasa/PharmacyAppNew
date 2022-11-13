import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/product/list_productAll/list_product.dart';
import 'package:pharmacy_appnew_version/Screens/product/medical/medical_product.dart';
import 'package:pharmacy_appnew_version/Screens/product/popular/popular_product_mainpage.dart';
import 'package:pharmacy_appnew_version/Screens/product/screen_product_simple.dart';
import 'package:pharmacy_appnew_version/Widgets/section_title.dart';

import '../../Widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      appBar: CustomAppBarPage(),
      bottomNavigationBar: CustomNavigationBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 150, child: HeroCarouselCart()),
            SizedBox(
              height: 20,
            ),
            SectionTitle(title: 'ផលិតផលរបស់យើង'),
            ScreenSimpleProductPage(),
            SectionTitle(title: 'ផលិតផលកំពុងពេញនិយម'),
            PopularProductPage(),
            SectionTitle(title: 'ផលិតផល'),
            AllProductPage(),
          ],
        ),
      ),
    );
  }
}
