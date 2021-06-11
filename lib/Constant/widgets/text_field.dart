import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:google_fonts/google_fonts.dart';

textField(TextEditingController controller, String labelText, String hintText,
    TextInputType inputType) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    height: 65.0,
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: primarylight,
      border: Border.all(color: primarylight),
    ),
    child: TextField(
      keyboardType: inputType,
      controller: controller,
      style: TextStyle(color: whitecolor),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          labelText: labelText,
          labelStyle: GoogleFonts.quicksand(color: whitecolor, fontSize: 20),
          hintText: hintText,
          hintStyle: GoogleFonts.quicksand(color: whitecolor, fontSize: 15),
          border: InputBorder.none),
    ),
  );
}
