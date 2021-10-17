import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';

class MedicineInputBox extends StatelessWidget {
  const MedicineInputBox({
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
      height: 75.0,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        minLines: 2,
        maxLines: 5,
        style: TextStyle(
          color: primarycolor,
        ),
        decoration: InputDecoration(
          labelText: inputLabel,
          labelStyle: TextStyle(color: primarycolor, fontSize: 16.0),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: inputHint,
          hintStyle: TextStyle(color: primarycolor, fontSize: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
