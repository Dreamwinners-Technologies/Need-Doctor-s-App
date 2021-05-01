import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/LoginPage.dart';
import 'package:need_doctors/view/Pagesetup.dart';
import 'package:your_splash/your_splash.dart' as sp;
import 'dart:convert';

final storage = FlutterSecureStorage();

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    getToken();
  }

  String token;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _weight = MediaQuery.of(context).size.width;
    return sp.SplashScreen.timed(
      route: nextScreen(),
      seconds: 3,
      body: Scaffold(
        body: CustomPaint(
          painter: BluePainter(),
          child: Container(
            height: _height,
            width: _weight,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoSet(_weight),
                title(),
                // SizedBox(
                //   height: 20,
                // ),
                // FadeAnimation(
                //   1,
                //   Container(
                //     height: 250.0,
                //     width: 220.0,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(20.0),
                //       child: Image.asset(
                //         "asset/images/baby_one.jpg",
                //       ),
                //     ),
                //   ),
                // ),
                // button(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getToken() async {
    String tokenRead = await storage.read(key: "jwtToken");

    print(tokenRead);
    setState(() {
      token = tokenRead;
    });
  }

  MaterialPageRoute nextScreen() {
    if (token == null) {
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );
    } else {
      Map<String, dynamic> decodedToken = parseJwt(token);

      int expTime = int.parse(decodedToken['exp'].toString()) * 1000;
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      expTime-=20000000;

      print(expTime);
      print(currentTime);

      if(expTime > currentTime){
        return MaterialPageRoute(
          builder: (_) => PageSetup(),
        );
      }
      else {
        sendToast("Token Expired. Please Login Again");
        storage.deleteAll();
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      }

    }
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

//All Part:

// Timer(Duration(milliseconds: 5000), () {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (ctx) => LoginScreen(),
//       ));
// }

  Widget logoSet(double size) {
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
      2,
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
