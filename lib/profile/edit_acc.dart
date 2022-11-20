import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharmacy_appnew_version/models/user/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'គណនី',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage('assets/images1/u_logo.jpg'),
                    radius: 80,
                  ),
                ),
              ),
              Text(
                "នាមត្រកូល",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  hintText: "គន្ធ",
                  hintStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
              ),
              Text(
                "នាមឈ្មោះ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  hintText: "រក្សា",
                  hintStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
              ),
              Text(
                "អាស័យដ្ឋាន",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.place,
                    color: Colors.green,
                  ),
                  hintText: "សៀមរាប",
                  hintStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
              ),
              Text(
                "អុីម៉ែល",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  hintText: "raksakun628@gmail.com",
                  hintStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
              ),
              Text(
                "លេខទូរស័ព្ទ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                readOnly: true,
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  hintStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220, top: 30),
                child: ElevatedButton(
                  child: Text(
                    'កែតម្រូវ',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    // side: BorderSide(color: Colors.yellow, width: 5),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () async {
                    updateUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
