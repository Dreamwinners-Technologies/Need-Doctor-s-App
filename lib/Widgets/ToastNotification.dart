import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void sendToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff00BAA0),
      textColor: Colors.white,
      fontSize: 16.0);
}