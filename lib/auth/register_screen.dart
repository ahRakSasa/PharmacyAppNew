// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:pharmacy_appnew_version/Screens/screens.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   double screenHeight = 0;
//   double screenWidth = 0;
//   double bottom = 0;
//   String otpPin = " ";
//   String countryDial = "+855";
//   String verID = " ";
//   int screenState = 0;

//   Color blue = Color.fromARGB(255, 101, 194, 78);

//   Future<void> verifyPhone(String number) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: number,
//         timeout: Duration(seconds: 20),
//         verificationCompleted: ((phoneAuthCredential credential) {
//           showSnackBarText("Auth Completed!");
//         }),
//         verificationFailed: (FirebaseAuthException e) {
//           showSnackBarText("Auth Failed!");
//         },
//         codeSent: (String verificationId, int? resenToken) {
//           showSnackBarText("OTP Sent!");
//           verID = verificationId;
//           setState(() {
//             screenState = 1;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           showSnackBarText("Timeout");
//         });
//   }

//   Future<void> verifyOTP() async {
//     await FirebaseAuth.instance
//         .signInWithCredential(
//       PhoneAuthProvider.credential(
//         verificationId: verID,
//         smsCode: otpPin,
//       ),
//     )
//         .whenComplete(
//       () {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => SplashScreen(),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     bottom = MediaQuery.of(context).viewInsets.bottom;

//     return WillPopScope(
//       onWillPop: () {
//         setState(() {
//           screenState = 0;
//         });
//         return Future.value(false);
//       },
//       child: Scaffold(
//         backgroundColor: blue,
//         body: SizedBox(
//           height: screenHeight,
//           width: screenWidth,
//           child: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: screenHeight / 8),
//                   child: Column(
//                     children: [
//                       Text(
//                         "JOIN US",
//                         style: GoogleFonts.montserrat(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth / 8,
//                         ),
//                       ),
//                       Text(
//                         "បង្តើតគណនីថ្ងៃនេះ",
//                         style: GoogleFonts.montserrat(
//                           color: Colors.white,
//                           fontSize: screenWidth / 15,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: circle(5),
//               ),
//               Transform.translate(
//                 offset: const Offset(30, -30),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: circle(4.5),
//                 ),
//               ),
//               Center(
//                 child: circle(3),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: AnimatedContainer(
//                   height: bottom > 0 ? screenHeight : screenHeight / 2,
//                   width: screenWidth,
//                   color: Colors.white,
//                   duration: const Duration(milliseconds: 800),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: screenWidth / 12,
//                       right: screenWidth / 12,
//                       top: bottom > 0 ? screenHeight / 12 : 0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         screenState == 0 ? stateRegister() : stateOTP(),
//                         GestureDetector(
//                           onTap: () {
//                             if (screenState == 0) {
//                               if (screenState == 0) {
//                                 showSnackBarText("ឈ្មោះគណនីមិនទាន់មាន");
//                               } else if (phoneController.text.isEmpty) {
//                                 showSnackBarText("លេខទូរស័ព្ទមិនទាន់មាន");
//                               } else {
//                                 verifyPhone(countryDial + phoneController.text);
//                               }
//                             } else {
//                               if (otpPin.length >= 6) {
//                                 verifyOTP();
//                               } else {
//                                 showSnackBarText("Enter OTP correctly!");
//                               }
//                             }
//                           },
//                           child: Container(
//                             height: 50,
//                             width: screenWidth,
//                             margin: EdgeInsets.only(bottom: screenHeight / 12),
//                             decoration: BoxDecoration(
//                               color: blue,
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "បន្ត",
//                                 style: GoogleFonts.montserrat(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 1.5,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showSnackBarText(String text) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data')));
//   }

//   Widget stateRegister() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "ឈ្មោះគណនី",
//           style: GoogleFonts.montserrat(
//               color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         TextFormField(
//           controller: usernameController,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Text(
//           "លេខទូរស័ព្ទ",
//           style: GoogleFonts.montserrat(
//               color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         IntlPhoneField(
//           controller: phoneController,
//           showCountryFlag: false,
//           showDropdownIcon: false,
//           initialValue: countryDial,
//           onCountryChanged: (country) {
//             setState(() {
//               countryDial = "+" + country.dialCode;
//             });
//           },
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget stateOTP() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "ពួកយើងបានផ្ញើរកូដទៅកាន់ ",
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontSize: 18,
//                 ),
//               ),
//               TextSpan(
//                 text: countryDial + phoneController.text,
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               TextSpan(
//                 text: "\nសរសេរលេខកូដនៅទីនេះ​ហើយអ្នកនឹងអាចបន្ត!",
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth / 12),
//           child: PinCodeTextField(
//             appContext: context,
//             length: 6,
//             onChanged: (value) {
//               setState(() {
//                 otpPin = value;
//               });
//               print(otpPin);
//             },
//             pinTheme: PinTheme(
//               activeColor: blue,
//               selectedColor: blue,
//               inactiveColor: Colors.black26,
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "មិនបានទទួលកូដ ",
//                 style: GoogleFonts.montserrat(
//                   color: Colors.black87,
//                   fontSize: 12,
//                 ),
//               ),
//               WidgetSpan(
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       screenState = 0;
//                     });
//                   },
//                   child: Text(
//                     "ផ្ញើរម្តងទៀត",
//                     style: GoogleFonts.montserrat(
//                       color: Colors.black87,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget circle(double size) {
//     return Container(
//       height: screenHeight / size,
//       width: screenHeight / size,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//       ),
//     );
//   }
// }
