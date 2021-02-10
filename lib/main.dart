import 'package:flutter/material.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/EditProfile.dart';
import 'package:need_doctors/view/Moderator.dart';
import 'package:need_doctors/view/OtpPage.dart';
import 'package:need_doctors/view/SplashScreen.dart';
import 'view/MyApp.dart';


void main() {
  runApp(MyApp());
}
//Test Git
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModeratorPage(),
    );
  }
}
