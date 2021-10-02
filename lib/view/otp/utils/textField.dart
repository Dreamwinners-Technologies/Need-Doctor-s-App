import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Constant/color/color.dart';

textFiedlOtem(TextEditingController controller, String labelText) {
  return Padding(
    padding: new EdgeInsets.all(30),
    child: Card(
      child: new TextField(
        style: GoogleFonts.quicksand(color: primarycolor, fontSize: 19.0),
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          hintStyle: GoogleFonts.quicksand(color: primarycolor),
          border: InputBorder.none,
          hintText: labelText,
        ),
      ),
    ),
  );
}


