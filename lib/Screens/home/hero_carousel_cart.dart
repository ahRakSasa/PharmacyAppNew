import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeroCarouselCart extends StatefulWidget {
  const HeroCarouselCart({
    Key? key,
  }) : super(key: key);

  @override
  State<HeroCarouselCart> createState() => _HeroCarouselCartState();
}

class _HeroCarouselCartState extends State<HeroCarouselCart> {
  final CollectionReference _banners =
      FirebaseFirestore.instance.collection('banner');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
      child: StreamBuilder(
          stream: _banners.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return CarouselSlider(
                        items: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                    documentSnapshot['imageAsset'].toString(),
                                    fit: BoxFit.cover,
                                    width: 300.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      documentSnapshot['title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                            aspectRatio: 1.5,
                            viewportFraction: 0.9,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            enlargeCenterPage: true));
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
