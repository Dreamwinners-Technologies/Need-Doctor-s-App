import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Constant/widgets/text_field.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/login/utils/loginBtn.dart';

loginCenterElmnt(BuildContext context, TextEditingController phoneController) {
  return FadeAnimation(
      1,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 12.0, right: 12.0),
              child: textField(
                  phoneController, phone, enterphone, TextInputType.number)),
          loginbutton(context, phoneController),
        ],
      ));
}
