
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';

class MedicineInputField extends StatelessWidget {
  const MedicineInputField({
    Key key,
    @required this.controller,
    @required this.inputLabel,
    @required this.inputHint,
  }) : super(key: key);

  final TextEditingController controller;
  final String inputLabel;
  final String inputHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: primarycolor,
        ),
        decoration: InputDecoration(
          labelText: inputLabel,
          labelStyle: TextStyle(color: primarycolor, fontSize: 16),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: inputHint,
          hintStyle: TextStyle(color: primarycolor, fontSize: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
