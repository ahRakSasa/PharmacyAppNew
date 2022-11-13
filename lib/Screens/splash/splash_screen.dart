import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
import 'package:pharmacy_appnew_version/auth/otp/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = "";
  Future<void> checkUser() async {
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString("userToken")!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
        (() => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return token == "" ? RegisterScreen() : HomeScreen();
              },
            ))));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/images1/logo1.png'),
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
