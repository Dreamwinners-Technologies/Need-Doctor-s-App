// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/service.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/view/splash/utils/body.dart';
import 'package:need_doctors/view/splash/utils/next_screen.dart';
import 'package:your_splash/your_splash.dart' as sp;
import 'package:permission_handler/permission_handler.dart';

final storage = FlutterSecureStorage();

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    //Call To Get Token
    getToken();
  }

  //Initilization
  String token;

  bool _permission = false;

  void _getPermission() async {
    final grant = await Permission.sms.request().isGranted;
    setState(() {
      _permission = grant;
    });

    if (_permission == false) {
      sendToast("Please Allow Permission\nRe-Open Your App");
    } else {
      print("Permission Done");
    }
  }

  @override
  void initState() {
    //hide status bar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    _getPermission();
    super.initState();
  }

  @override
  void dispose() {
    //show status bar
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  //get Token:
  Future<String> getToken() async {
    String tokenRead = await storage.read(key: TOKEN_KEY);
    setState(() {
      token = tokenRead;
    });
    return token;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return sp.SplashScreen.timed(
      //route next view
      route: nextScreen(token),
      seconds: 5,
      body: Scaffold(backgroundColor: primarycolor, body: splashBody(size)),
    );
  }
}

//Unused mybe delete later

// class BluePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final height = size.height;
//     final width = size.width;
//     Paint paint = Paint();

//     Path mainBackground = Path();
//     mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
//     paint.color = Color(0xff008080);
//     canvas.drawPath(mainBackground, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }


//unused mybe delete later:
 // Widget button(BuildContext context) {
  //   return Container(
  //     child: GestureDetector(
  //       onTap: () async {
  //         String token = await storage.read(key: "jwtToken");

  //         print(token);

  //         if (token == null) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => LoginScreen(),
  //             ),
  //           );
  //         } else {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => PageSetup(),
  //             ),
  //           );
  //         }
  //       },
  //       child: Container(
  //         margin: const EdgeInsets.only(top: 14.0),
  //         height: 35.0,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(17.0),
  //           color: white,
  //         ),
  //         width: 80.0,
  //         child: Icon(Icons.arrow_forward_ios),
  //       ),
  //     ),
  //   );
  // }