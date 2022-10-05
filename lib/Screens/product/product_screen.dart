import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Screens/product/popular_product_card.dart';

import '../../Widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> docId = [];

  getAllProducts() async {
    await FirebaseFirestore.instance
        .collection('product')
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
    return Scaffold(
      appBar: CustomAppBarPage(),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          InkWell(
            child: const Icon(
              Icons.share,
              color: Colors.black,
              size: 30,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PopularProductCard()));
            },
          ),
          IconButton(
            onPressed: () {
              final snackBar =
                  SnackBar(content: Text('Added to your WishList!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.black, // Background color
              onPrimary: Colors.green, // Text Color (Foreground color)
            ),
            child: Text(
              'ADD TO CARD',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true),
            items: [
              HeroCarouselCart(),
              // ListView.builder(
              //   itemCount: docId.length,
              //   itemBuilder: (context, index) {
              //     return GetImagePage(documentId: docId[index]);
              //   },
              // )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.black.withAlpha(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   widget.product.name,
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodyText2!
                      //       .copyWith(color: Colors.white),
                      // ),
                      // Text(
                      //   '${widget.product.price}',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodyText2!
                      //       .copyWith(color: Colors.white),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline6,
              ),
              children: [
                ListTile(
                    // title: Text(
                    //   widget.product.discription,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyText2!
                    //       .copyWith(color: Colors.black),
                    // ),
                    )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Address',
                style: Theme.of(context).textTheme.headline6,
              ),
              children: [
                ListTile(
                    // title: Text(
                    //   widget.product.discription,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyText2!
                    //       .copyWith(color: Colors.black),
                    // ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
