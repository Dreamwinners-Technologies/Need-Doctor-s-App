
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
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
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              FadeAnimation(1, Image.asset('asset/logog.png'),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(1, Text(
                    'Need',
                    style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(0xff00BAA0),),
                  ),),
                  SizedBox(width: 10,),
                  FadeAnimation(1, Text(
                    'Doctor',
                    style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),
                  ),),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1,  _buildTextField(
                      nameController,  'Phone', 'Enter Your Phone'),
                  ),FadeAnimation(1, Text(
                    'Login your won account',
                    style: TextStyle(fontSize: 22,color: Colors.black),
                  ),),
                  SizedBox(height: 20,),

                  SizedBox(height: 40,),
                  FadeAnimation(1,
                    MaterialButton(
                      minWidth: 100,
                      height: 35,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () {
                        print("tap");
                      },
                      color: logoGreen,
                      child: Text('GO',
                          style: TextStyle(color: Color(0xff008080), fontSize: 25, fontWeight: FontWeight.bold)),
                    ),),
                  SizedBox(height: 100,),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 100,),
                        FadeAnimation(1,
                      Text('Not Have Account Yet?', style: TextStyle(color: Colors.white, fontSize: 20),),),
                        FadeAnimation(1,
                        FlatButton(
                          onPressed: (){
                            print('Pressed');
                          },
                          child:
                        Text('Register', style: TextStyle(color: Color(0xff00BAA0), fontSize: 20),),),),
                    ],
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




_buildTextField(
    TextEditingController controller, String labelText, String hintText) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Color(0xff00BAA0), border: Border.all(color: Color(0xff00BAA0))),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
          border: InputBorder.none),
    ),
  );
}
