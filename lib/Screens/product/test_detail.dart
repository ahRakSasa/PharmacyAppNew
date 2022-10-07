import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestDetail extends StatefulWidget {
  const TestDetail({super.key});

  @override
  State<TestDetail> createState() => _TestDetailState();
}

class _TestDetailState extends State<TestDetail> {
   final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
      
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}