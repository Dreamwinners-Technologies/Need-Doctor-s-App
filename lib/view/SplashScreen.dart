import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/LoginPage.dart';
import 'package:need_doctors/view/Pagesetup.dart';

final storage = FlutterSecureStorage();

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _weight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: Container(
          height: _height,
          width: _weight,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [logoset(_weight), title(), button(context)],
          ),
        ),
      ),
    );
  }
}

//All Part:

// Timer(Duration(milliseconds: 5000), () {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (ctx) => LoginScreen(),
//       ));
// }

Widget logoset(double size) {
  return FadeAnimation(
    1,
    Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: white, width: 2.0)),
        height: size / 3.0,
        width: size / 3.0,
        child: Image.asset(logo)),
  );
}

Widget title() {
  return FadeAnimation(
    1,
    Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              need,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: doctor,
              )
            ],
          ),
          coummunity
        ],
      ),
    ),
  );
}

Widget button(BuildContext context) {
  return Container(
    child: GestureDetector(
      onTap: () async {
        String token = await storage.read(key: "jwtToken");

        print(token);

        if (token == null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageSetup(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 14.0),
        height: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.0),
          color: white,
        ),
        width: 80.0,
        child: Icon(Icons.arrow_forward_ios),
      ),
    ),
  );
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
