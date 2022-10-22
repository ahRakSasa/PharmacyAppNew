import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/models/banners/banner_model.dart';

class HeroCarouselCart extends StatefulWidget {
  const HeroCarouselCart({Key? key}) : super(key: key);

  @override
  State<HeroCarouselCart> createState() => _HeroCarouselCartState();
}

class _HeroCarouselCartState extends State<HeroCarouselCart> {
  List<String> docsId = [];
  Future<Banners> getBanner(String docId) async {
    final docBanner =
        FirebaseFirestore.instance.collection('banner').doc(docId);
    final snapshot = await docBanner.get();
    if (snapshot.exists) {
      return Banners.fromJson(snapshot.data()!);
    }
    return Banners.fromJson(snapshot.data()!);
  }

  Future getDocsID() async {
    await FirebaseFirestore.instance.collection('banner').get().then((value) {
      value.docs.forEach((DocumentSnapshot document) {
        setState(() {
          docsId.add(document.reference.id);
        });
      });
    });
  }

  var temDocsId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temDocsId = getDocsID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      body: CarouselSlider.builder(
        itemCount: docsId.length,
        itemBuilder: (context, index, realIndex) {
          return FutureBuilder(
            future: getBanner(docsId[index]),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something wrong....!!'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text('Laoding.....'),
                );
              } else {
                final dataBanner = snapshot.data!;
                print('data:$dataBanner');
                return dataBanner == null
                    ? const Center(
                        child: Text('No student'),
                      )
                    : buildViewBanner(banner: dataBanner as Banners);
              }
            },
          );
        },
        options: CarouselOptions(
          height: 165,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget buildViewBanner({Banners? banner}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(banner!.imageAsset, fit: BoxFit.cover, width: 300.0),
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
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                banner!.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
