import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';

donontandresend() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      sText("Don't get the OTP?", primaryColor, 16.0, FontWeight.bold),
      // ignore: deprecated_member_use
      FlatButton(
        onPressed: () {
          print('Pressed');
        },
        child: sText("Resend", primaryColor, 20.0, FontWeight.bold),
      ),
    ],
  );
}
