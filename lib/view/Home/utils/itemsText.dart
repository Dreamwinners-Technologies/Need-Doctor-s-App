import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';

class ItemText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 15.0),
      child: Text(
        "Items",
        style: TextStyle(
            color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }
}
