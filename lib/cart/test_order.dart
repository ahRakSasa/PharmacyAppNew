import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class OrderTestPage extends StatefulWidget {
  const OrderTestPage({super.key});

  @override
  State<OrderTestPage> createState() => _OrderTestPageState();
}

class _OrderTestPageState extends State<OrderTestPage> {
  TextEditingController amountController = TextEditingController();
  
  final functions = FirebaseFunctions.instance;
  Future<void> writeUser() async {
    HttpsCallable callable = functions.httpsCallable('createOrder');
    try {
      final resp = await callable.call(<String, dynamic>{
        'amount': "",
        'products': "",
        'payment_method': "",
        'tracking_number': "",
        'order_id': "",
        'uid': "",
        'userInfo': "",
        'products': "",
      });
      print("result: ${resp.data}");
    } on FirebaseException catch (error) {
      print("error:${error}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
