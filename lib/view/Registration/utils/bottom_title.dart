import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/Constant/widgets/go_other_view.dart';

regibottomTittle(BuildContext context) {
  return FadeAnimation(
      1,
      Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: gootherView('Already Have Account?', "Login", () {
            Navigator.pushNamed(context, LOGIN_VIEW);
          }, 19.0),
        ),
      ));
}
