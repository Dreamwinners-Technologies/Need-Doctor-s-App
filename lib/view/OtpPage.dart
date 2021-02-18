import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/models/JwtResponseModel.dart';
import 'package:need_doctors/view/Dashboard.dart';
import 'package:need_doctors/view/HomePage.dart';
import 'package:need_doctors/view/Pagesetup.dart';
import '../networking/LoginRegistrationNetwork.dart';

final storage = FlutterSecureStorage();

class OtpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpScreen(String phone) {
    this.phoneNo=phone;
  }

  String phoneNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 35, 30, 30),
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.arrow_back_ios,
                      size: 24, color: Color(0xff008080)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomPaint(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Image.asset('asset/password.png'),
                ),
                FadeAnimation(
                  1,
                  Text(
                    'We need to text you the OTP \n to authenticate your account',
                    style: TextStyle(fontSize: 26, color: Color(0xff008080)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    _buildTextField1(
                      otpController,
                      'OTP Code',
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1,
                        Text(
                          "Don't get the OTP?",
                          style:
                              TextStyle(color: Color(0xff008080), fontSize: 18),
                        ),
                      ),
                      FadeAnimation(
                        1,
                        FlatButton(
                          onPressed: () {
                            print('Pressed');
                          },
                          child: Text(
                            'Resend OTP.',
                            style: TextStyle(
                                color: Color(0xff008080),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  1,
                  MaterialButton(
                    minWidth: 120,
                    height: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0))),
                    onPressed: () async {
                      print("tap");
                      int otp = int.parse(otpController.text);
                      JwtResponseModel jwtResponseModel = await verifyOtp(phoneNo: phoneNo, otp: otp );

                      storage.write(key: "jwtToken", value: jwtResponseModel.token);

                      for(final i in jwtResponseModel.roles){
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
                    color: Color(0xff008080),
                    child: Text('Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_buildTextField1(TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1.5, color: Color(0xff008080))),
    child: TextField(
      controller: controller,
      style: TextStyle(
          color: Color(0xff008080), fontSize: 22, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 130),
          hintText: labelText,
          hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 22,
              fontWeight: FontWeight.normal),
          border: InputBorder.none),
    ),
  );
}
