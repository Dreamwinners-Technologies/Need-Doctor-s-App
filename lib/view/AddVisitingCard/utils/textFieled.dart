import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';

buildTextField1(
    TextEditingController controller, String labelText, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    height: 49.0,
    width: MediaQuery.of(context).size.width * .9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2.0, color: Color(0xffe7e7e7))),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Color(0xff008080)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
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
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
          border: InputBorder.none),
    ),
  );
}
