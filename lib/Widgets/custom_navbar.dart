import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Screens/place/branches.dart';
import 'package:pharmacy_appnew_version/Screens/product/popular_product_card.dart';
import 'package:pharmacy_appnew_version/Screens/product/product_screen.dart';

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
        child: const Icon(Icons.person, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PopularProductCard()));
        },
      ),
      InkWell(
        child: const Icon(Icons.settings, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PopularProductCard()));
        },
      ),
      InkWell(
        child: const Icon(Icons.home, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PopularProductCard()));
        },
      ),
      InkWell(
        child: const Icon(Icons.place, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BranchPage()));
        },
      ),
      InkWell(
        child: const Icon(Icons.add_shopping_cart, size: 30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PopularProductCard(),
            ),
          );
        },
      ),
    ];
    return CurvedNavigationBar(
      color: Colors.green,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      items: items,
      index: index,
      height: 60,
      onTap: (index) => setState(() => this.index = index),
    );
  }
}
