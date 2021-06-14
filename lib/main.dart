import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Constant/theme/theme.dart';
import 'package:need_doctors/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    routes: AppRoutes(),
  ));
  //always portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //set statusbar color and status elements color:
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor, statusBarIconBrightness: Brightness.light));
}

//start point
class MyApp extends StatelessWidget {
  final AppRoutes routes;

  const MyApp({Key key, this.routes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: appTheme,
      onGenerateRoute: routes.ongenarateRoutes,
    );
  }
}
