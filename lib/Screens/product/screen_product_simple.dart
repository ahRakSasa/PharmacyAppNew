import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/product/Hello/hello_products.dart';
import 'package:pharmacy_appnew_version/Screens/product/Test_Products/test_products.dart';
import 'package:pharmacy_appnew_version/Screens/product/medical/medical_product.dart';

class ScreenSimpleProductPage extends StatefulWidget {
  const ScreenSimpleProductPage({super.key});

  @override
  State<ScreenSimpleProductPage> createState() =>
      _ScreenSimpleProductPageState();
}

class _ScreenSimpleProductPageState extends State<ScreenSimpleProductPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MedicalProducts();
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                width: 120,
                child: Card(
                    child: Column(
                  children: [
                    Container(
                        height: 120,
                        child: Image(
                            image: AssetImage('assets/images1/skincare.png'))),
                    Text(
                      'Medical',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return TestProducts();
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                width: 120,
                child: Card(
                    child: Column(
                  children: [
                    Container(
                        height: 120,
                        child: Image(
                            image: AssetImage('assets/images1/baby1.jpg'))),
                    Text(
                      'Baby Care',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HelloProducts();
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                width: 120,
                child: Card(
                    child: Column(
                  children: [
                    Container(
                        height: 120,
                        child: Image(
                            image: AssetImage('assets/images1/pill.jpg'))),
                    Text(
                      'Pills',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
