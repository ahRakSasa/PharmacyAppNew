import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';

import 'package:pharmacy_appnew_version/Screens/place/branches.dart';
import 'package:pharmacy_appnew_version/cart/cart.dart';
import 'package:pharmacy_appnew_version/setting/About_Us/home_screen_about.dart';
import 'package:pharmacy_appnew_version/setting/setting_screen.dart';

class CustomNavigationBarPage extends StatefulWidget {
  const CustomNavigationBarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavigationBarPage> createState() =>
      _CustomNavigationBarPageState();
}

class _CustomNavigationBarPageState extends State<CustomNavigationBarPage> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBottomNavigationBar(),
    );
  }

  CurvedNavigationBar _buildBottomNavigationBar() {
    final items = <Widget>[
      InkWell(
        child: const Icon(Icons.info, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AboutUsHomePage()));
        },
      ),
      InkWell(
        child: const Icon(Icons.settings, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingScreen()));
        },
      ),
      InkWell(
        child: const Icon(Icons.home, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
      InkWell(
        child: const Icon(Icons.place, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BranchScreen()));
        },
      ),
      InkWell(
        child: const Icon(Icons.add_shopping_cart, size: 30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyCart(),
            ),
          );
        },
      ),
    ];
    return CurvedNavigationBar(
      color: Colors.green,
      //buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      items: items,
      index: index,
      height: 60,
      onTap: (index) => setState(() => this.index = index),
    );
  }
}
