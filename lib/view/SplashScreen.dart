import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/HomePage.dart';
import 'package:need_doctors/view/LoginPage.dart';

import 'Pagesetup.dart';

final storage = FlutterSecureStorage();

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(milliseconds: 5000), () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (ctx) => LoginScreen(),
    //       ));
    // });
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: FadeAnimation(
                    1,
                    Image.asset('asset/logog.png'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Need',
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: primaryLight),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Doctor',
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    ],
                  ),
                ),
                FadeAnimation(
                  1,
                  Text(
                    'Find Doctor Community',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 250.0,
                    width: 220.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "asset/images/baby_one.jpg",
// <<<<<<< HEAD
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: GestureDetector(
//                     onTap: () async {
//                       String token = await storage.read(key: "jwtToken");
//
//                       print(token);
//
//                       if (token == null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginScreen(),
//                           ),
//                         );
//                       } else {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => PageSetup(),
//                           ),
//                         );
//                       }
//                     },
//                     child: Icon(Icons.arrow_forward_ios),
//                   ),
//                 ),
// =======
                      ),
                    ),
                  ),
                ),
                Container(
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
                ),
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
              ],
            ),
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
