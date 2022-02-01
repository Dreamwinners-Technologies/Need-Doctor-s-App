// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/TextConstants.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/common/launch_playstore.dart';
import 'package:need_doctors/models/StaticData/UserfulLinks/UseFulLink.dart';
import 'package:need_doctors/models/StaticData/UserfulLinks/UsefulLinkStaticData.dart';
import 'package:need_doctors/networking/UserNetworkHolder.dart';
import 'package:need_doctors/service/NoSQLConfig.dart';
import 'package:need_doctors/view/AboutApp/AboutApp.dart';
import 'package:need_doctors/view/Home/Widget/UsefulLinkWebview.dart';
import 'package:need_doctors/view/Home/utils/banner.dart';
import 'package:need_doctors/view/Home/utils/homeItems.dart';
import 'package:need_doctors/view/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:need_doctors/view/TermsAndConditions/TermsAndCondition.dart';
import 'package:need_doctors/view/login/LoginPage.dart';
import 'package:url_launcher/url_launcher.dart';

final storage = FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() async {
    await getUsers();
  }

  List<UsefulLink> usefulLinks =
      usefulLinkFromJson(jsonEncode(usefulLinksStaticData));

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

                  noSqlConfig.saveAmbulanceData(true);
                  noSqlConfig.saveVisitingCardData(true);
                  noSqlConfig.saveData(true);
                  Navigator.pop(context);
                },
              );
            },
          ),
          /*IconButton(
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

                  // storage.write(key: "isNewApp", value: "false");
                  // storage.write(key: ISAMBULANCEDATASAVE, value: "false");

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

                  //delte ambulance
                  BoxStoreAmbulance boxStoree = BoxStoreAmbulance();
                  var storee = await boxStoree.getAmbulanceStore();
                  var boxx = storee.box<ListOfAmbulance>();
                  boxx.removeAll();
                  //delete medicine
                  // BoxStoreDrug boxStore = BoxStoreDrug();
                  // var store = await boxStore.getDrugStore();
                  // var box = store.box<DrugDetails>();
                  // box.removeAll();
                },
              );
            },
          )*/
        ],
      ),
      drawer: AppDrawerWidget(),
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
              Card(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Useful Links:",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: usefulLinks.map((e) {
                            return HorizontalCard(data: e);
                          }).toList()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              HomeItem(),
            ],
          ),
        ),
      ),
    );
  }
}

final flutterWebviewPlugin = new FlutterWebviewPlugin();

class HorizontalCard extends StatelessWidget {
  HorizontalCard({
    Key key,
    String title,
    UsefulLink data,
  }) {
    this.title = title;
    this.data = data;
  }

  String title;
  UsefulLink data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(data.link);

        if (data.type == "app") {
          try {
            launch(data.link);
          } on PlatformException catch (_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsefulLinkWebView(usefulLink: data),
              ),
            );
          } finally {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsefulLinkWebView(usefulLink: data),
              ),
            );
          }
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UsefulLinkWebView(usefulLink: data),
            ),
          );
        }
      },
      child: Card(
        //color: tea,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(width: 1, color: Color(0xffe7e7e7))),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          height: (MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 10)) /
              4.5,
          width: (MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 10)) /
              4.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  height: 30.0,
                  width: 30.0,
                  // child: SvgPicture.asset(
                  //   "",
                  // ),
                  // child: Image.asset(data.icon, scale: 1.5,)
                  child: Image.asset(
                    data.icon,
                    scale: 1.5,
                  )),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sText(data.title, black, 12.0, FontWeight.w500),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title:
                const Text('Check Updates', style: TextStyle(fontSize: 15.0)),
            onTap: () {
              PlayStoreLaunch().launchURL(appdownloadlink);
              //  sendToast("Coming Soon");
            },
          ),
          ListTile(
            title: const Text('Terms and Condition',
                style: TextStyle(fontSize: 15.0)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsAndCondition()));
            },
          ),
          ListTile(
            title:
                const Text('Privacy Policy', style: TextStyle(fontSize: 15.0)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            },
          ),
          ListTile(
            title: const Text('About App', style: TextStyle(fontSize: 15.0)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutApp()));
            },
          ),
          //Logout button
          ListTile(
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {
              askDialog(
                context,
                "Logout",
                'Do You Want to Logout?',
                DialogType.WARNING,
                () async {
                  await storage.deleteAll();
                  // storage.write(key: "isNewApp", value: "false");
                  // storage.write(key: ISAMBULANCEDATASAVE, value: "false");

                  // Navigator.pop(context);
                  //Navigator.popUntil(context, (route) => route.isFirst);
                  //Navigator.push(context, route)
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation) {
                          return LoginScreen();
                        },
                        transitionsBuilder: (BuildContext context,
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
                        },
                      ),
                      (Route route) => false);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
