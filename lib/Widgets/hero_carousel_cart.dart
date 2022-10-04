import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/controller/banner/get_banner.dart';
import 'package:pharmacy_appnew_version/controller/product/get_image_firebase_controller.dart';
import 'package:pharmacy_appnew_version/model/category_model.dart';
import 'package:pharmacy_appnew_version/model/model.dart';

class HeroCarouselCart extends StatefulWidget {
  final Category? category;
  final Product? product;
  const HeroCarouselCart({Key? key, this.category, this.product})
      : super(key: key);

  @override
  State<HeroCarouselCart> createState() => _HeroCarouselCartState();
}

class _HeroCarouselCartState extends State<HeroCarouselCart> {
  List<String> docId = [];

  getAllProducts() async {
    await FirebaseFirestore.instance
        .collection('banner')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docId.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
    print(docId);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.widget.product == null) {
          Navigator.pushNamed(context, '/catalog', arguments: widget.category);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                  widget.product == null
                      ? widget.category!.imageAsset
                      : widget.product!.imageAsset,
                  fit: BoxFit.cover,
                  width: 1000.0),

              // ListView.builder(
              //   itemCount: docId.length,
              //   itemBuilder: (context, index) {
              //     return GetBannerPage(bannerId: docId[index]);
              //   },
              // ),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    widget.product == null
                        ? widget.category!.title
                        : widget.product!.name,
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
      ),
    );
  }
}
