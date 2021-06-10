import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/SplashScreen.dart';

void main() {
  runApp(MyApp());
  //always porait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

//start point
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return MaterialApp(
              // debugShowCheckedModeBanner: false,
              title: 'Need Doctor',
              theme: ThemeData(primaryColor: primaryColor),
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
