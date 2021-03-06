import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/view/Profile/utils/headerArea.dart';
import 'package:need_doctors/view/Profile/utils/textInfo.dart';
import 'package:need_doctors/org_data/text_style.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0.0, title: myprofiletex),
        body: Container(
            child:
                profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 80.0,
          color: primarycolor,
        ),

        Padding(
          padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
          child: Card(
            child: Container(
                padding: EdgeInsets.only(
                    top: 8.0, left: 10.0, right: 10.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerArea(context),
                    infotext('018********', 'email@gmail.com', 'Speciality',
                        'Organaization', 'Address'),
                  ],
                )),
          ),
        )
        //headerArea(context),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10.0, top: 8),
        //   child: sText("Info", primarycolor, 15, FontWeight.bold),
        // ),
        //details
        // infotext('018********', 'email@gmail.com', 'Speciality',
        //     'Organaization', 'Address')
      ],
    );
  }
}
