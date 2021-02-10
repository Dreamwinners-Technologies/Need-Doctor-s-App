
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/view/LoginPage.dart';




class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   Timer(Duration(milliseconds: 8000), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => LoginScreen(),
          ));
    });
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(1, Image.asset('asset/logog.png'),),
              SizedBox(height: 10,),
              FadeAnimation(1, Text(
                'Need Doctor',
                style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),
              ),),
              FadeAnimation(1, Text(
                'Find Doctor Community',
                style: TextStyle(fontSize: 26,color: Colors.white),
              ),),
            ],
          ),
        ),
      ),
    );
  }

}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Color(0xff008080);
    canvas.drawPath(mainBackground, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
