import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/Manage_Medicine.dart';

void main() {
  runApp(MyApp());
}

//Test Git
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: primaryColor),
      home: ManageMedicine(),
    );
  }
}
