import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/SplashScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

//Test Git
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
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
