import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Widgets/section_title.dart';
import 'package:pharmacy_appnew_version/controller/test_firebase/firebase_controller.dart';
import 'package:pharmacy_appnew_version/controller/banner/get_banner.dart';
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
                      // items: [
                      //   Container(
                      //     width: 300,
                      //     height: 70,
                      //     child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: docId.length,
                      //       itemBuilder: (context, index) {
                      //         return GetBannerPage(bannerId: docId[index]);
                      //       },
                      //     ),
                      //   )
                      //],
                      
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     docId = await FirebaseController().getAllProducts();
      //   },
      //   child: const Text('get'),
      // ),
    );
  }
}
