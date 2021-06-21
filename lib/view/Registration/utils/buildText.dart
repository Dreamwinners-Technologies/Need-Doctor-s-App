import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';

//TextField Widgets
buildTextField(
    TextEditingController controller, String labelText, String hintText,TextInputType type) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    height: 65.0,
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: lightcolor,
      border: Border.all(color: primaryLight),
      ),
    child: TextField(
      controller: controller,
      keyboardType: type,
      style: GoogleFonts.quicksand(color: primarycolor, fontSize: 18, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          labelText: labelText,
          labelStyle: TextStyle(color: primaryColor, fontSize: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: primarycolor, fontSize: 15),
          border: InputBorder.none),
      ),
    );
}
