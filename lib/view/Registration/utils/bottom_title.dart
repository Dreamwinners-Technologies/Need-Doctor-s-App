import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/Constant/text/text.dart';

regibottomTittle(BuildContext context) {
  return FadeAnimation(
    1,
    Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          // child: gootherView(
          //   'Already Have Account?',
          //   "Login",
          //   () {
          //     Navigator.pushReplacementNamed(context, LOGIN_VIEW);
          //   },
          //   19.0,
          // ),
          child: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have Account?",
                  style: TextStyle(color: Colors.white, fontSize: 19.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  height: 32.0,
                  child: MaterialButton(
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: sText('Login', primaryColor, 22, FontWeight.bold),
                    onPressed: () {
                      Navigator.pushNamed(context, LOGIN_VIEW);
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
  );
}
