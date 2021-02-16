import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';


final storage = FlutterSecureStorage();

class ControlPanel extends StatefulWidget {

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {


  String getsvg = "asset/svg/search_icon.svg";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:
      AppBar(
        backgroundColor: primaryColor,
        title: Text("Control Panel"),
    ),
      body: FadeAnimation(
        1,
        Container(
          padding: EdgeInsets.only(left: 6.0, bottom: 6.0, top: 4.0),
          child: ListView(
            children: [
              //setBanner

              SizedBox(
                height: 15.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    //Row one:
                    Row(
                      children: [
                        controlwidget(getsvg, 'Add Moderator', context),
                        controlwidget(getsvg, 'Add Drug', context),
                        controlwidget(getsvg, 'Add Visiting card', context),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    //Row two:
                    Row(
                      children: [
                        controlwidget(getsvg, '4', context),
                        controlwidget(getsvg, '5', context),
                        controlwidget(getsvg, '6', context),
                      ],
                    ),
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
