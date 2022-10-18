import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/setting/About_Us/about_detail.dart';
import 'package:pharmacy_appnew_version/setting/About_Us/constant.dart';

import 'data.dart';

class AboutUsHomePage extends StatefulWidget {
  const AboutUsHomePage({super.key});

  @override
  _AboutUsHomePageState createState() => _AboutUsHomePageState();
}

class _AboutUsHomePageState extends State<AboutUsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'About Our Pharmacy',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    // DropdownButton(
                    //   items: [
                    //     DropdownMenuItem(
                    //       child: Text(
                    //         'Solar System',
                    //         style: TextStyle(
                    //           fontFamily: 'Avenir',
                    //           fontSize: 24,
                    //           color: const Color(0x7cdbf1ff),
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //         textAlign: TextAlign.left,
                    //       ),
                    //     ),
                    //   ],
                    //   onChanged: (value) {},
                    //   icon: Padding(
                    //     padding: const EdgeInsets.only(left: 16.0),
                    //     child: Image.asset('assets/drop_down_icon.png'),
                    //   ),
                    //   underline: SizedBox(),
                    // ),
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => AboutUsDetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Solar System',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Know more',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.network(planets[index].iconImage),
                          ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              planets[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 200,
                                color: primaryTextColor.withOpacity(0.08),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(36.0),
      //     ),
      //     color: navigationColor,
      //   ),
      //   padding: const EdgeInsets.all(24),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.menu),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.search_rounded),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.person),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}