import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/users_model.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<String> docsId = [];
  Future<Users?> getUsers(String docId) async {
    final docProduct =
        FirebaseFirestore.instance.collection('users').doc(docId);
    final snapshot = await docProduct.get();
    if (snapshot.exists) {
      // return branchFromJson(snapshot.data()! as Map<String,dynamic>);
      return Users.fromJson(snapshot.data()!);
    }
    return Users.fromJson(snapshot.data()!);
  }

  Future getDocsID() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("userToken")!;
    var doc = await FirebaseFirestore.instance.doc("users/$token");
    doc.get().then((value) {
      var data = value.data() as Map<String, dynamic>;
      setState(() {
        phoneController.text = data['phone'];
        firstNameController.text = data['firstname'];
        lastNameController.text = data['lastname'];
        emailController.text = data['email'];
        addressController.text = data['address'];
      });
    });
  }

  Future<void> updateUser() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        addressController.text.isEmpty) {
      SnackBar(
        content: Text("ព័ត៍មានមិនគ្រប់គ្រាន់"),
      );
    } else {
      var prefs = await SharedPreferences.getInstance();
      var uid = prefs.getString("userToken")!;
      try {
        var doc = await FirebaseFirestore.instance.doc("users/$uid").update({
          'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'address': addressController.text,
          'email': emailController.text,
        }).then((value) {
          //print(firstNameController.value);
        });
      } catch (e) {
        return null;
      }
    }
  }

  var temDocsId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temDocsId = getDocsID();
    //updateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'សង្ខេប',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'សូមបំពេញព័ត៍មានបន្ថែមរបស់អ្នក',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        hintText: 'នាមឈ្មោះ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        hintText: 'នាមត្រកូល',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        hintText: 'អាស័យដ្ឋាន',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        hintText: 'លេខទូរស័ព្ទ',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'ទំនិញដែលអ្នកបានកម្មង់',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: const Icon(Icons.list),
                              trailing: const Text(
                                "GFG",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              title: Text("List item $index"));
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'សរុប',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '34',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {},
              child: const Text(
                'ធ្វើការទូទាត់',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
