import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/JwtResponseModel.dart';
import 'package:need_doctors/networking/LoginRegistrationNetwork.dart';

final storage = FlutterSecureStorage();

submitbutton(
    TextEditingController otpController, String phoneNo, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: MaterialButton(
      minWidth: 120,
      height: 36,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      onPressed: () async {
        print("tap");

        if (otpController.text.isEmpty) {
          customDialog(context, 'OTP is Empty', "Sorry! OTP cannot be empty",
              DialogType.ERROR);
        } else if (otpController.text.length != 6) {
          customDialog(context, 'OTP is Invalid',
              "Sorry! Please a valid OTP code", DialogType.ERROR);
        } else {
          int otp = int.parse(otpController.text);
          JwtResponseModel jwtResponseModel =
              await verifyOtp(phoneNo: phoneNo, otp: otp);

          storage.write(key: "jwtToken", value: jwtResponseModel.token);

          for (final i in jwtResponseModel.roles) {
            print('$i');
            storage.write(key: "jwtRole$i", value: '$i');
          }
          // storage.write(key: jwtToken, value: jwtResponseModel.token);
          Navigator.pushReplacementNamed(context, BOTTOM_VIEW);
        }
      },
      color: primarycolor,
      child: sText('Send', whitecolor, 20.0, FontWeight.bold),
    ),
  );
}
