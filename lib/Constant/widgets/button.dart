import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key key,
      this.title,
      this.tap,
      this.borderRadius,
      this.bgcolor,
      this.titleColor})
      : super(key: key);

  final String title;
  final Color bgcolor;
  final Color titleColor;
  final GestureTapCallback tap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0.0,
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: sText(title, titleColor == null ? white : titleColor, 14.0,
            FontWeight.bold),
        onPressed: tap,
        onLongPress: tap,
        color: bgcolor == null ? primaryColor : bgcolor,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius == null
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(borderRadius)));
  }
}
