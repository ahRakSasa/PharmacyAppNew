import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
import 'package:pharmacy_appnew_version/Screens/place/branches.dart';
import 'package:pharmacy_appnew_version/cart/cart.dart';
import 'package:pharmacy_appnew_version/setting/About_Us/home_screen_about.dart';
import 'package:pharmacy_appnew_version/setting/setting_screen.dart';

CurvedNavigationBar buildBottomNavigationBar(
    BuildContext context, int current) {
  final items = <Widget>[
    const Icon(Icons.info, size: 30),
    const Icon(Icons.settings, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.place),
    const Icon(Icons.add_shopping_cart, size: 30),
  ];

  final List<Widget> pages = [
    AboutUsHomePage(),
    SettingScreen(),
    HomeScreen(),
    BranchScreen(),
    MyCart(),
  ];

  return CurvedNavigationBar(
      color: Colors.green,
      backgroundColor: Colors.white,
      //buttonBackgroundColor: Colors.white,
      animationCurve: Curves.easeIn,
      animationDuration: Duration(milliseconds: 2000),
      items: items,
      index: current,
      height: 60,
      onTap: (index) {
        current = index;
        print("pushing");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => pages[current]));
      });
}
