import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';




textFormBox({String label, String hint, TextEditingController textController}) {
  // ignore: unused_local_variable
  bool valid = true;
  if (textController.text.isNotEmpty) {
    valid = false;
  }

  return Container(
    height: 45.0,
    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: TextFormField(
      controller: textController,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      style: TextStyle(
        color: primarycolor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black87, fontSize: 18.0),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black54, fontSize: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
  );
}
