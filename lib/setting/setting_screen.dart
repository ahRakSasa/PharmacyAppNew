import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
import 'package:pharmacy_appnew_version/Screens/partner/partner.dart';
import 'package:pharmacy_appnew_version/auth/otp/register.dart';
import 'package:pharmacy_appnew_version/bottom/bottom_until.dart';
import 'package:pharmacy_appnew_version/profile/edit_acc.dart';
import 'package:pharmacy_appnew_version/setting/About_Us/home_screen_about.dart';
import 'package:pharmacy_appnew_version/setting/contact/contact_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bottom/custom_navbar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

Future clearPrefer() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.remove("userToken");
}

class _SettingScreenState extends State<SettingScreen> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'ការកំណត់',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, 1),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 245, 245, 245),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white38,
                  child: Image.asset('assets/images1/logo1.png'),
                  height: 230,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
                  height: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage();
                            },
                          ));
                        },
                        child: Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green, width: 2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.green,
                                ),
                                Text(
                                  'កែប្រែគណនី',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ContactListPage();
                            },
                          ));
                        },
                        child: Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green, width: 2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.contact_phone,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                Text(
                                  'ទំនាក់ទំនង',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PartnerShipPage();
                            },
                          ));
                        },
                        child: Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green, width: 2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.place_outlined,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                Text(
                                  'ដៃគូរសហការណ៍',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          clearPrefer();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ));
                        },
                        child: Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green, width: 2),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                Text(
                                  'ចាកចេញ',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
