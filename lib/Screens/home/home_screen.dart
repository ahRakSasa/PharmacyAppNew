import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Widgets/section_title.dart';
import 'package:pharmacy_appnew_version/model/category_model.dart';

import '../../Widgets/widgets.dart';
import '../../blocs/category/category_bloc.dart';
import '../../model/model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> docId = [];
  final CollectionReference prod =
      FirebaseFirestore.instance.collection('products');
  // Future getDocId() async {
  //   await FirebaseFirestore.instance
  //       .collection('products')
  //       .get()
  //       .then((value) => value.docs.forEach((element) {
  //             print('DocID:${element.reference.id}');
  //             docId.add(element.reference.id);
  //           }));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(title: 'Our Pharmacy'),
      bottomNavigationBar: CustomNavigationBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true),
                      items: Category.categories
                          .map((category) =>
                              HeroCarouselCart(category: category))
                          .toList(),
                    );
                  } else {
                    return Text('Something went wrong!');
                  }
                },
              ),
            ),
            SectionTitle(title: 'ផលិតផលកុំពុងពេញនិយម'),
            ProductCarousel(
                products: Product.products
                    .where((product) => product.popular)
                    .toList()),
            SectionTitle(title: 'ផលិតផលថែរក្សាសម្រស់'),
            ProductCarousel(
                products: Product.products
                    .where((product) => product.popular)
                    .toList()),
          ],
        ),
      ),
    );
  }
}
