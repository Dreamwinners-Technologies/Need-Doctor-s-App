import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';

textBox(
    {BuildContext context,
    String label,
    String hint,
    TextEditingController textController,
    double boxSize}) {
  if (boxSize == null) {
    boxSize = MediaQuery.of(context).size.width;
  }
  return Container(
    height: 45.0,
    width: boxSize,
    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: TextField(
      controller: textController,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: primarycolor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: primarycolor, fontSize: 16),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        hintText: hint,
        hintStyle: TextStyle(color: primarycolor, fontSize: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
  );
}
