import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';

import '../../Widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ))));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.green),
            child: Text(
              'Welcome To Our Pharmacy',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
