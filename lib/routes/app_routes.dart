import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/view/splash/SplashScreen.dart';

class AppRoutes {
  Route ongenarateRoutes(RouteSettings settings) {
    switch (settings.name) {
      //splash view
      case START:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      default:
        print('View Not Found');
        return null;
    }
  }
}
