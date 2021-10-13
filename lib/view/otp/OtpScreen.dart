import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/controller/otp_controller.dart';

import 'package:need_doctors/view/otp/utils/logo.dart';
import 'package:need_doctors/view/otp/utils/resentBtn.dart';
import 'package:need_doctors/view/otp/utils/submitBtn.dart';
import 'package:need_doctors/view/otp/utils/textField.dart';
import 'package:get/get.dart';

final storage = FlutterSecureStorage();

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  final OtpController otpstateController = Get.put(OtpController());

  OtpScreen(String phone) {
    this.phoneNo = phone;
    otpstateController.phone = phone;
  }

  String phoneNo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        otpstateController.otpCode.value = '';
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: sText("OTP", whitecolor, 20.0, FontWeight.bold),
          ),
          body: otpBody(context, size)),
    );
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
            Obx(() {
              otpController.text = otpstateController.otpCode.value;

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                child: textFiedlOtem(
                  otpController,
                  'Enter Your OTP',
                ),
              );
            }),

            //resend button
            donontandresend(),

            //send button
            Obx(() {
              return otpstateController.isFeatching.value == false
                  ? submitbutton(otpController, phoneNo, context)
                  : sText(
                      "Please Wait...", primarycolor, 20.0, FontWeight.bold);
            })
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     sText("Please Wait ", primarycolor, 24.0, FontWeight.bold),
            //     SizedBox(
            //       width: 25.0,
            //       height: 25,
            //       child: CircularProgressIndicator(color: primarycolor,))
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
