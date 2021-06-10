import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/models/JwtResponseModel.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/RegiPage.dart';

import '../networking/LoginRegistrationNetwork.dart';
import 'OtpPage.dart';
import 'Pagesetup.dart';

final storage = FlutterSecureStorage();

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _weight = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primarycolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: FadeAnimation(
              1,
              Container(
                height: _height,
                width: _weight,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        logoSet(_weight),
                        logintitle(),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 12.0, right: 12.0),
                            child: buildTextField(
                                phoneController, phone, enterphone)),
                        loginbutton(context, phoneController),
                      ],
                    ),
                    Positioned(
                        bottom: 30.0,
                        right: _weight / 20,
                        child: goanotherpage(context)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

Widget logoSet(double size) {
  return FadeAnimation(
    1,
    Container(
        margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: white, width: 2.0)),
        height: size / 3.0,
        width: size / 3.0,
        child: Image.asset(logo)),
  );
}

Widget logintitle() {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            need,
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: doctor,
            )
          ],
        ),
        loginacc
      ],
    ),
  );
}

Widget loginbutton(BuildContext context, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200.0,
          width: 200.0,
          child: Image.asset(mapimage),
        ),
        Positioned(
          top: 64.0,
          left: 62.0,
          child: GestureDetector(
            onTap: () async {
              print("CLick");
              JwtResponseModel jwtResponse =
                  await attemptLogIn(phone: controller.text);

              storage.write(key: "jwtToken", value: jwtResponse.token);

              for (final i in jwtResponse.roles) {
                print('$i');
                storage.write(key: "jwtRole$i", value: '$i');
              }

              if (jwtResponse.token == null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(controller.text),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageSetup(),
                  ),
                );
              }
            },
            child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(shape: BoxShape.circle, color: red),
              child: Center(
                child: gotext,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget goanotherpage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        nothaveacc,
        FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegiPage()));
            },
            child: register),
      ],
    ),
  );
}
