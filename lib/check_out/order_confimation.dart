import 'package:flutter/material.dart';

import 'order_summary.dart';

class OrderConfimation extends StatefulWidget {
  const OrderConfimation({super.key});

  @override
  State<OrderConfimation> createState() => _OrderConfimationState();
}

class _OrderConfimationState extends State<OrderConfimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: Image(
                    image: AssetImage('assets/images1/boss4.jpg'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your order is complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
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
                    'សួស្តី រក្សា',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'អគុណសម្រាប់ការជឿទុកចិត្តលើក្រុមហ៊ុនយើងខ្ញុំ',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'ORDER CODE: #k321-ekd3',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  OrderSummary(),
                  SizedBox(height: 20),
                  Text(
                    'ព័ត៌មានលម្អិតអំពីការបញ្ជាទិញ',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Divider(thickness: 2),
                  SizedBox(height: 5),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // ProductCard.summary(
                      //   product: Product.products[0],
                      //   quantity: 2,
                      // ),
                      // ProductCard.summary(
                      //   product: Product.products[0],
                      //   quantity: 2,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
