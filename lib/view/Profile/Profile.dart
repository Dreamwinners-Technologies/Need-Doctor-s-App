import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/view/Profile/utils/editButton.dart';
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
        appBar: AppBar(
            actions: [editbutton(context)], elevation: 0.0, title: myprofiletex),
        body:Container(child: profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        headerArea(),
        infotext("Dr. Name", 'Sepcality', 'Organization',
            'Discritc', 'Thana')
      ],
    );
  }
}






