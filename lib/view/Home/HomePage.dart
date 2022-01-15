import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/TextConstants.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/service/NoSQLConfig.dart';
import 'package:need_doctors/view/AboutApp/AboutApp.dart';
import 'package:need_doctors/view/Home/utils/banner.dart';
import 'package:need_doctors/view/Home/utils/homeItems.dart';
import 'package:need_doctors/view/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:need_doctors/view/TermsAndConditions/TermsAndCondition.dart';
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
          "Need Doctor's",
          style: kTextStyle,
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

                  noSqlConfig.saveData(true);
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
              askDialog(
                context,
                "Logout",
                'Do You Want to Logout?',
                DialogType.WARNING,
                () async {
                  await storage.deleteAll();
                  storage.write(key: "isNewApp", value: "false");

                  // Navigator.pop(context);
                  //Navigator.popUntil(context, (route) => route.isFirst);
                  //Navigator.push(context, route)
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                          return LoginScreen();
                        },
                        transitionsBuilder:
                            (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                          return new SlideTransition(
                            position: new Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                      (Route route) => false);
                },
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      height: 70.0,
                      width: 70.0,
                      child: Image.asset('asset/images/doctor.png'),
                    ),
                    Text(
                      "Need Doctors App",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Text(
                      "Version: 0.1.0.B",
                      style: TextStyle(fontSize: 15.0, color: whitecolor),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Check Updates', style: TextStyle(fontSize: 15.0)),
              onTap: () {
                sendToast("Coming Soon");
              },
            ),
            ListTile(
              title: const Text('Terms and Condition', style: TextStyle(fontSize: 15.0)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndCondition()));
              },
            ),
            ListTile(
              title: const Text('Privacy Policy', style: TextStyle(fontSize: 15.0)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
            ),
            ListTile(
              title: const Text('About App', style: TextStyle(fontSize: 15.0)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()));
              },
            ),
          ],
        ),
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
