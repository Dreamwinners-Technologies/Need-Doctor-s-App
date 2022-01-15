import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/Constant/widgets/bottomsheet.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/JwtResponseModel.dart';
import 'package:need_doctors/networking/LoginRegistrationNetwork.dart';
import 'package:need_doctors/org_data/text_style.dart';

final storage = FlutterSecureStorage();

Widget loginbutton(BuildContext context, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: SizedBox(
      height: 35.0,
      width: 100.0,
      child: MaterialButton(
        color: whitecolor,
        child: gotext,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        onPressed: () async {
          print("CLick");
          //check phone no is empty or invalid
          if (controller.text.isEmpty) {
            customDialog(
              context,
              "Phone is Empty",
              "Sorry! Phone number cannot be empty",
              DialogType.ERROR,
            );
          } else if (controller.text.length > 11 ||
              controller.text.length < 11) {
            customDialog(
              context,
              "Phone is Invalid",
              "Sorry! Please Enter a valid phone number",
              DialogType.ERROR,
            );
          } else {
            //action
            customBottomSheet(context, "Login...");
            JwtResponseModel jwtResponse;
            try {
              jwtResponse =
                  await attemptLogIn(phone: controller.text, context: context);
            } on SocketException catch (_) {
              sendToast(
                  "No Internet Connection. Please connect Internet first.");
              print('not connected');

              throw new SocketException('not connected');
            }

            await storage.write(key: "jwtToken", value: jwtResponse.token);
            print(jwtResponse.token);

            print(await storage.read(key: "jwtToken"));

            String tempRole = "";
            for (final i in jwtResponse.roles) {
              print('$i');
              storage.write(key: "jwtRole$i", value: '$i');
              tempRole += i;
            }

            storage.write(key: "userType", value: tempRole);

            if (jwtResponse.token == null) {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, OTP_VIEW,
                  arguments: controller.text);
            } else {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, BOTTOM_VIEW);
            }
          }
        },
        //circular go button
      ),
    ),
  );
}
