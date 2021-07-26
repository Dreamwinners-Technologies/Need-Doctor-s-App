import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Constant/color/color.dart';

buildTextField1(
    TextEditingController controller, String labelText, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    height: 60.0,
    width: MediaQuery.of(context).size.width * .9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2.0, color: Color(0xffe7e7e7))),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Color(0xff008080)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          labelText: labelText,
          labelStyle: GoogleFonts.quicksand(color: primarycolor, fontSize: 18, fontWeight: FontWeight.bold),
          // hintText: hintText,
          hintStyle: GoogleFonts.quicksand(color: primarycolor, fontSize: 15, fontWeight: FontWeight.bold),
          border: InputBorder.none),
    ),
  );
}

buildTextField2(
    TextEditingController controller, String labelText, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    width: MediaQuery.of(context).size.width * .9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2.0, color: Color(0xffe7e7e7))),
    child: TextFormField(
      maxLines: 8,
      controller: controller,
      style: TextStyle(color: primarycolor),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
          labelText: labelText,
          labelStyle: GoogleFonts.quicksand(color: primarycolor, fontSize: 18, fontWeight: FontWeight.bold),
          // hintText: hintText,
          hintStyle: GoogleFonts.quicksand(color: primarycolor, fontSize: 15, fontWeight: FontWeight.bold),
          border: InputBorder.none),
    ),
  );
}
