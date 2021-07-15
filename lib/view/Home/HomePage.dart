import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/service/NoSQLConfig.dart';
import 'package:need_doctors/view/Home/utils/banner.dart';
import 'package:need_doctors/view/Home/utils/homeItems.dart';
import 'package:need_doctors/view/login/LoginPage.dart';

final storage = FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Need Doctor",
          style: TextStyle(color: white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.cloud_download,
              color: white,
            ),
            onPressed: () {
              // customDialog(
              //     context,
              //     "Sync Data",
              //     'Do You Want to Re Download Data from Internet?',
              //     DialogType.INFO);


              askDialog(
                context,
                "Sync Data",
                'Do You Want to Re Download Data from Internet?',
                DialogType.INFO,
                () async {
                  print("clicked ");
                  NoSQLConfig noSqlConfig = NoSQLConfig();

                  noSqlConfig.saveData();
                  Navigator.pop(context);
                },
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: white,
            ),
            onPressed: () {
              askDialog(context, "Logout", 'Do You Want to Logout?',
                  DialogType.WARNING, () async {
                await storage.deleteAll();

                // Navigator.pop(context);
                //Navigator.popUntil(context, (route) => route.isFirst);
                //Navigator.push(context, route)
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation animation, Animation secondaryAnimation) {
                      return LoginScreen();
                    }, transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return new SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    }),
                    (Route route) => false);
              });
            },
          )
        ],
      ),
      body: FadeAnimation(
        1,
        Container(
          padding: EdgeInsets.only(left: 6.0, bottom: 4.0, top: 4.0),
          child: ListView(
            children: [
              //setBanner
              Banners(),
              //Set Items:
              //ItemText(),
              SizedBox(
                height: 15,
              ),
              HomeItem(),
            ],
          ),
        ),
      ),
    );
  }
}
