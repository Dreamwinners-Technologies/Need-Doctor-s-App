import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/view/login/utils/bottom_title.dart';
import 'package:need_doctors/view/login/utils/center_elmnt.dart';
import 'package:need_doctors/view/login/utils/logo.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: primarycolor, body: loginBody(context, size));
  }

  //Ui Body
  loginBody(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              children: [
                //logo & title
                logoLogin(size),

                //textfield && login button=>center element:
                loginCenterElmnt(context, phoneController),
              ],
            ),
            //Bottom Title
            loginbottomTittle(context)
          ],
        ),
      ),
    );
  }
}
