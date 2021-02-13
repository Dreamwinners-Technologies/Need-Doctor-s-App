import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/LoginPage.dart';
=======
import 'package:need_doctors/item/DropDown.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/AddMedicine.dart';
import 'package:need_doctors/view/Profile.dart';
import 'package:need_doctors/view/Moderator.dart';
import 'package:need_doctors/view/OtpPage.dart';
import 'package:need_doctors/view/ProfileEdit.dart';
import 'package:need_doctors/view/SplashScreen.dart';
import 'view/MyApp.dart';
>>>>>>> ebea0021abdaa7d3ea8d6bd19a2331e7c823f00b


void main() {
  runApp(MyApp());
}
//Test Git
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      theme: ThemeData(primaryColor: primaryColor),
      home: LoginScreen(),
=======
      home: AddMedicine(),
>>>>>>> ebea0021abdaa7d3ea8d6bd19a2331e7c823f00b
    );
  }
}
