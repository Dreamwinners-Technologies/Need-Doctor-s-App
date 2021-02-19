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
  String groupSvg = "asset/svg/group.svg";
  String drugSvg = "asset/svg/drugs.svg";
  String cardSvg = "asset/svg/business-cards.svg";


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
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    //Row one:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        controlwidget(groupSvg, 'Add Moderator', context),
                        controlwidget(drugSvg, 'Add Drug', context),
                        controlwidget(cardSvg, 'Add Visiting card', context),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        controlwidget(getsvg, 'Coming Soon', context),
                        controlwidget(drugSvg, 'Edit Drug', context),
                        controlwidget(cardSvg, 'Edit Visiting Card', context),
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
