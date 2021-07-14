// import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Constant/theme/theme.dart';
import 'package:need_doctors/routes/app_routes.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  print(0);

  // await Permission.storage.request();
  // print(0);
  // var status = await Permission.storage.status;
  // print(0);
  // if (!status.isGranted) {
  //   await Permission.storage.request();
  // }
  //
  // print(status);
  // io.Directory applicationDirectory =
  // await getApplicationDocumentsDirectory();
  // print(applicationDirectory.path);


  // Hive
  // ..init(dir.path)
  // ..registerAdapter(DrugDetailsAdapter());

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    routes: AppRoutes(),
  ));

  print(1);
  var dir = await getExternalStorageDirectory();

  print(dir.path);
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(DrugDetailsAdapter());

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
      title: APP_NAME,
      theme: appTheme,
      onGenerateRoute: routes.ongenarateRoutes,
    );
  }
}
