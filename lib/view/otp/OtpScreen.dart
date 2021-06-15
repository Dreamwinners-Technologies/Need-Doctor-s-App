import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

import 'package:need_doctors/view/otp/utils/logo.dart';
import 'package:need_doctors/view/otp/utils/resentBtn.dart';
import 'package:need_doctors/view/otp/utils/submitBtn.dart';
import 'package:need_doctors/view/otp/utils/textField.dart';

final storage = FlutterSecureStorage();

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpScreen(String phone) {
    this.phoneNo = phone;
  }

  String phoneNo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: sText("OTP", whitecolor, 20.0, FontWeight.bold),
        ),
        body: otpBody(context, size));
  }

  //UI Body
  otpBody(BuildContext context, Size size) {
    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //image
            imagset(size.width),

            //title
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: rText('We just need your', ' OTP', primarycolor,
                  primarylight, 22.0, FontWeight.bold),
            ),
            sText(
                'to verify your account', primarycolor, 22.0, FontWeight.bold),

            //text field
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
              child: textFiedlOtem(
                otpController,
                'Enter Your OTP',
              ),
            ),

            //resend button
            donontandresend(),

            //send button
            submitbutton(otpController, phoneNo, context),
          ],
        ),
      ),
    );
  }
}
