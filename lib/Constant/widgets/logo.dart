import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Constant/assets/assets_tittle.dart';
import 'package:need_doctors/Constant/color/color.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  const LogoWidget({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1,
      Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primarylight, width: 2.0)),
          height: size,
          width: size,
          child: Image.asset(LOGO)),
    );
  }
}

Widget logoSet(double size) {
  return FadeAnimation(
    1,
    Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: whitecolor, width: 2.0)),
        height: size,
        width: size,
        child: Image.asset(LOGO)),
  );
}
