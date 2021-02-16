import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/ControlPanel.dart';
import 'package:need_doctors/view/HomePage.dart';
import 'package:need_doctors/view/LoginPage.dart';
import 'package:need_doctors/view/SplashScreen.dart';


void main() {
  runApp(MyApp());
}

//Test Git
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: primaryColor),
      // home: SplashScreen(),
     home: LoginScreen(),
    );
  }
}
