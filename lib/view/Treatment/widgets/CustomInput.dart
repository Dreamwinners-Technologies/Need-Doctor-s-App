import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Constant/color/color.dart';

class CustomInput extends StatelessWidget {
  CustomInput(TextEditingController controller, String fieldName, String hintText, TextInputType inputType) {
    this.textEditingController = controller;
    this.fieldName = fieldName;
    this.hintText = hintText;
    this.inputType = inputType;
  }

  TextEditingController textEditingController = TextEditingController();
  String fieldName;
  String hintText;
  TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: TextField(
        controller: textEditingController,
        keyboardType: inputType,
        style: GoogleFonts.quicksand(color: primarycolor, fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: fieldName,
          labelStyle: TextStyle(color: primarycolor, fontSize: 16),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: hintText,
          hintStyle: TextStyle(color: primarycolor, fontSize: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
