

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/ProfileEdit.dart';

// <<<<<<< HEAD
// class MyProfile extends StatelessWidget {
// =======
// class EditProfile extends StatelessWidget {
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

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
            actions: [editbtn(context)], elevation: 0.0, title: myprofiletex),
        body:Container(child: profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        headerArea(),
        infotext("Dr. Name", '018********', 'Sepcality', 'Organization',
            'Discritc', 'Thana')
      ],
    );
  }
}

editbtn(BuildContext context) {
  return new Center(
    child: new Container(
      margin: const EdgeInsets.only(right: 14.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryLight,
      ),
      child: new Material(
        child: new InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileEdit()));
          },
          child: new Container(
            width: 38.0,
            height: 38.0,
            child: Icon(Icons.edit),
          ),
        ),
        color: Colors.transparent,
      ),
    ),
  );
}

headerArea() {
  return Container(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    color: primaryColor,
    width: double.infinity,
    child: Column(
      children: [
        Container(
          color: primaryColor,
          padding: const EdgeInsets.only(left: 5.0, right: 12.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: Image.asset("asset/Avatar1.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                    child: drnametext,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 5.0),
                    child: phonetext,
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

infotext(String name, String phone, String specality, String org,
    String discrict, String thana) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildText(name),
          _buildText(phone),
          _buildText(specality),
          _buildText(org),
          _buildText(discrict),
          _buildText(thana),
        ],
      ),
    ),
  );
}

_buildText(String labelText) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(bottom: 7.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
    ),
    child: Text(
      labelText,
      style: TextStyle(
          color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
