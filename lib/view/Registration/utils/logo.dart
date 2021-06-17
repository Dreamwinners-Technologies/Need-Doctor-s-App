import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/logo.dart';

logoRegistration(Size size) {
  return Padding(
    padding: const EdgeInsets.only(top: 70.0),
    child: Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Logo
          FadeAnimation(
              1,
              Hero(
                tag: 'logo',
                child: LogoWidget(
                  size: size.width / 3.2,
                ),
              )),

          Padding(
              padding: EdgeInsets.only(top: 14.0),
              child: FadeAnimation(
                1,
                sText('Create Your account', whitecolor, 18.0, FontWeight.bold),
              )),
        ],
      ),
    ),
  );
}
