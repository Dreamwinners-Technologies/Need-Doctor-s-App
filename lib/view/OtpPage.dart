import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/JwtResponseModel.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/Pagesetup.dart';
import '../networking/LoginRegistrationNetwork.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(enterotptext),
      ),
      body: CustomPaint(
        child: FadeAnimation(
          1,
          Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  imagset(width),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: otptile,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: _buildTextField1(
                      otpController,
                      'Enter Your OTP',
                    ),
                  ),
                  donontandresend(),
                  submitbutton(otpController, phoneNo, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

imagset(double width) {
  return Container(
      margin: const EdgeInsets.only(top: 12.0),
      height: width / 3,
      width: width / 3,
      child: Image.asset(
        lockimage,
        fit: BoxFit.cover,
      ));
}

donontandresend() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      donotgetotptext,
      FlatButton(
          onPressed: () {
            print('Pressed');
          },
          child: resentotptext),
    ],
  );
}

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
        int otp = int.parse(otpController.text);
        JwtResponseModel jwtResponseModel =
            await verifyOtp(phoneNo: phoneNo, otp: otp);

        storage.write(key: "jwtToken", value: jwtResponseModel.token);

        for (final i in jwtResponseModel.roles) {
          print('$i');
          storage.write(key: "jwtRole$i", value: '$i');
        }
        // storage.write(key: jwtToken, value: jwtResponseModel.token);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageSetup(),
          ),
        );
      },
      color: primaryColor,
      child: submittex,
    ),
  );
}

_buildTextField1(TextEditingController controller, String labelText) {
  return Padding(
    padding: new EdgeInsets.all(30.0),
    child: new TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: new BorderSide(color: primaryColor)),
        hintText: labelText,
      ),
    ),
  );
}
