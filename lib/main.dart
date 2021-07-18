// import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Constant/theme/theme.dart';
import 'package:need_doctors/routes/app_routes.dart';
import 'package:need_doctors/service/NoSQLConfig.dart';
import 'package:need_doctors/service/NotificationService.dart';
import 'package:path_provider/path_provider.dart';

final storage = FlutterSecureStorage();

void main() async {
  print(0);

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();

  runApp(MyApp(
    routes: AppRoutes(),
  ));

  print(1);
  var dir = await getExternalStorageDirectory();

  print(dir.path);

  String isNewApp = await storage.read(key: "isNewApp");
  if (isNewApp == null || isNewApp == "true") {
    print("New App");
    NoSQLConfig noSQLConfig = NoSQLConfig();
    noSQLConfig.saveData();
  }
  print(4);

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
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: appTheme,
      onGenerateRoute: routes.ongenarateRoutes,
    );
  }
}
