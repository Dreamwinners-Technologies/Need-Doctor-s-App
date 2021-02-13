import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/view/Regipage.dart';
import 'package:need_doctors/view/SplashScreen.dart';

class LoginScreen extends StatelessWidget {
  final Color primaryColor = Color(0xff007373);
  final Color secondaryColor = Color(0xff008080);

  final Color logoGreen = Color(0xffffffff);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
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
                        fontSize: 35,
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
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
<<<<<<< HEAD
                  FadeAnimation(
                    1,
                    Text(
                      'Login your won account',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FadeAnimation(
                    1,
                    buildTextField(nameController, 'Phone', 'Enter Your Phone'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FadeAnimation(
                    1,
=======
                  FadeAnimation(1,  _buildTextField(
                      nameController,  'Phone', 'Enter Your Phone'),
                  ),
                  FadeAnimation(1, Text(
                    'Login your won account',
                    style: TextStyle(fontSize: 22,color: Colors.black),
                  ),),
                  SizedBox(height: 20,),

                  SizedBox(height: 40,),
                  FadeAnimation(1,
>>>>>>> ebea0021abdaa7d3ea8d6bd19a2331e7c823f00b
                    MaterialButton(
                      minWidth: 100,
                      height: 35,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () {
                        print("tap");
                      },
                      color: logoGreen,
                      child: Text('GO',
                          style: TextStyle(
                              color: Color(0xff008080),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
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
                            height: 100,
                          ),
                          FadeAnimation(
                            1,
                            Text(
                              'Not Have Account Yet?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
                                )),
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
    );
  }
}
