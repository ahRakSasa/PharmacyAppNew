import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/Widgets/custom_appbar.dart';
import 'package:pharmacy_appnew_version/Widgets/custom_navbar.dart';
import 'package:pharmacy_appnew_version/Widgets/order_summary.dart';
import 'package:pharmacy_appnew_version/Widgets/widgets.dart';
import 'package:pharmacy_appnew_version/model/model.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order_confirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => OrderConfirmation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(title: 'Order Confirmation'),
      bottomNavigationBar: CustomNavigationBarPage(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 50,
                  top: 80,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Positioned(
                  top: 240,
                  height: 100,
                  width: (MediaQuery.of(context).size.width),
                  child: Text(
                    'Your order is complete',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.green),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ORDER CODE: 1110-03',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Thank you for purching on Our Pharmacy.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.green)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Order Code: 3490_56',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  OrderSummaryPage(),
                  Text(
                    'ORDER DETAIL',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(thickness: 2),
                  SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCart(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
