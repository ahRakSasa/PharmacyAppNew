import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;
  String otpPin = " ";
  String countryDial = "+855";
  String verID = " ";
  int screenState = 0;
  bool isLoading = false;

  Color green = Color(0xFF04B04F);

  var dbref;

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) async {
        showSnackBarText("Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Auth Failed!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OTP Sent!");
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Timeout!");
      },
    );
  }

  Future<void> verifyOTP() async {
    var prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .then((value) async {
      writeUser(
          phoneController.text,
          value.user!.uid.toString(),
          addressController.text,
          firstNameController.text,
          lastNameController.text,
          emailController.text
          );
      prefs.setString(
        "userToken",
        value.user!.uid.toString(),
      );
    }).whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  Future<bool> checkUser(uid) async {
    print(uid);
    var docRef = FirebaseFirestore.instance.doc("users/${uid}");
    var docSnap = await docRef.get();
    if (docSnap.exists) {
      return false;
    }
    return true;
  }

  final functions = FirebaseFunctions.instance;
  Future<void> writeUser(String phone, String uid, String address,
      String firstname, String lastname, String email) async {
    HttpsCallable callable = functions.httpsCallable('createUser');
    final checkDoc = await checkUser(uid);
    print(checkDoc);
    if (checkDoc == true) {
      try {
        final resp = await callable.call(<String, dynamic>{
          'address': address,
          'phone': phone,
          'email': email,
          'firstname': firstname,
          'lastname': lastname,
          'uid': uid,
        });
        print("result: ${resp.data}");
      } on FirebaseException catch (error) {
        print("error:${error}");
      }
    } else {
      print("doc already exits");
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: green,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "បង្កើតគណនីនៅទីនេះ",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: screenWidth / 12,
                        ),
                      ),
                      screenState == 0 ? stateRegister() : stateOTP(),
                      GestureDetector(
                        onTap: () {
                          if (screenState == 0) {
                            if (phoneController.text.isEmpty) {
                              showSnackBarText("សូមបំពេញលេខទូរស័ព្ទរបស់អ្នក");
                            } else {
                              verifyPhone(countryDial + phoneController.text);
                            }
                          } else {
                            if (otpPin.length >= 6) {
                              verifyOTP();
                            } else {
                              showSnackBarText("Enter OTP correctly!");
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            width: screenWidth,
                            margin: EdgeInsets.only(bottom: screenHeight / 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                "ចូលគណនី",
                                style: GoogleFonts.montserrat(
                                  color: Color.fromARGB(255, 9, 206, 111),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget stateRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "លេខទូរស័ព្ទ",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        IntlPhoneField(
          controller: phoneController,
          // showCountryFlag: false,
          // showDropdownIcon: false,
          initialValue: countryDial,
          onCountryChanged: (country) {
            setState(() {
              countryDial = "+" + country.dialCode;
            });
          },
          decoration: InputDecoration(
            labelText: '012345678',
            labelStyle: TextStyle(color: Color.fromARGB(255, 213, 213, 213)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2, color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2, color: Colors.white),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget stateOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "លេខកូដបានផ្ញើរទៅកាន់ទូរស័ព្ទរបស់អ្នក",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: countryDial + phoneController.text,
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "\nសូមបញ្ចូលលេខកូដរបស់អ្នក",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) {
            setState(() {
              otpPin = value;
            });
            print(otpPin);
          },
          pinTheme: PinTheme(
            activeColor: green,
            selectedColor: green,
            inactiveColor: Colors.black26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "មិនទទួលបានលេខកូដ?",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: Text(
                    "ផ្ញើរម្តងទៀត",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
