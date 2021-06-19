import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';

buildTextField1(TextEditingController controller, String labelText) {
  return Container(
    height: 55.0,
    margin: const EdgeInsets.only(top: 8.0),
    padding: const EdgeInsets.only(top: 4.0),
    decoration: BoxDecoration(
      color: lightcolor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1.0, color: primaryColor)),
    child: TextField(
      controller: controller,
      style: GoogleFonts.quicksand(color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          labelText: labelText,
          labelStyle: TextStyle(color: primaryColor, fontSize: 18),
          border: InputBorder.none),
      ),
    );
}
