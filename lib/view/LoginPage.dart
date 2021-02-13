import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/view/Regipage.dart';
import 'package:need_doctors/view/SplashScreen.dart';

import '../networking/LoginRegistrationNetwork.dart';

class LoginScreen extends StatelessWidget {
  final Color primaryColor = Color(0xff007373);
  final Color secondaryColor = Color(0xff008080);

  final Color logoGreen = Color(0xffffffff);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  1,
                  Image.asset('asset/logog.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        'Need',
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00BAA0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FadeAnimation(
                      1,
                      Text(
                        'Doctor',
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        'Login to your account',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    FadeAnimation(
                      1,
                      buildTextField(
                          phoneController, 'Phone', 'Enter Your Phone'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FadeAnimation(
                      1,
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 200.0,
                            width: 200.0,
                            child: Image.asset("asset/images/bdmap.png"),
                          ),
                          Positioned(
                            top: 64.0,
                            left: 62.0,
                            child: GestureDetector(
                              onTap: () {
                                print(phoneController.text);
                                attemptLogIn(phoneController.text);
// 01515212687
                                print("CLick");
                              },
                              child: InkWell(
                                child: Container(
                                  height: 45.0,
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffFF0000)),
                                  child: Center(
                                    child: Text('GO',
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            FadeAnimation(
                              1,
                              Text(
                                'Not Have Account Yet?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            FadeAnimation(
                              1,
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegiPage()));
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Color(0xff00BAA0), fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
