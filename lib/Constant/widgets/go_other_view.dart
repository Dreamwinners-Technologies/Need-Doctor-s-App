import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

Widget gootherView(
    String ftext, String ltext, GestureTapCallback tap, double size) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      sText(ftext, whitecolor, size, FontWeight.bold),
      MaterialButton(
        elevation: 0.0,
        minWidth: 70.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: primarycolor,
        onPressed: tap,
        child: sText(ltext, primarylight, size, FontWeight.bold),
      )
    ],
  );
}
