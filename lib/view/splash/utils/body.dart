import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Constant/assets/assets_tittle.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/logo.dart';
import 'package:lottie/lottie.dart';

//UI Body
splashBody(Size size) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 90.0),
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

              //Name & Title
              Padding(
                  child: FadeAnimation(
                      1,
                      rText(NEED, DOCTORS, primarylight, whitecolor, 35.0,
                          FontWeight.bold)),
                  padding: EdgeInsets.only(top: 15.0)),
              FadeAnimation(
                1,
                sText(APP_TITLE, whitecolor, 15.0, FontWeight.bold),
              )
            ],
          ),
        ),
      ),

      //Bottom Loader
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Lottie.asset(SPLASH_LOADER, width: 90.0, height: 90.0),
        ),
      )
    ],
  );
}
