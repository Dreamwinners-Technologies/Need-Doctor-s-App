import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/Profile/ProfileResponse.dart';
import 'package:need_doctors/networking/ProfileNetwork.dart';
import 'package:need_doctors/org_data/text_style.dart';


class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  _ProfileEditState() {
    getData();

  }

  void getData() async {
    ProfileResponse profileResponse;
    profileResponse = await getProfile();

    this.profileResponse = profileResponse;

  }
  ProfileResponse profileResponse;


  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController bmdcController = TextEditingController();
  // final TextEditingController speciaController = TextEditingController();
  // final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: editprofile),
        body:
            FadeAnimation(1, profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return ListView(
      padding: editfieldpadding,
      children: <Widget>[
        // _buildTextField1(nameController, drname),
        // _buildTextField1(nameController, bmdc),
        // _buildTextField1(nameController, spacalization),
        // _buildTextField1(nameController, phone),
        District(),
        Thana(),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
            child: Text("Update",
                style: TextStyle(
                  fontSize: 19.9,
                  fontWeight: FontWeight.bold,
                  color: white,
                )),
            color: primaryColor,
            minWidth: 100.0,
            height: 40,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

_buildTextField1(TextEditingController controller, String labelText) {
  return Container(
    margin: const EdgeInsets.only(top: 8.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2.0, color: primaryColor)),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          labelText: labelText,
          labelStyle: TextStyle(color: primaryColor, fontSize: 20),
          border: InputBorder.none),
    ),
  );
}

class Thana extends StatelessWidget {
  String valueChoose;
  String selectText;
  List ListItem = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 2.0, color: Color(0xff008080))),
          child: DropdownButton(
            hint: thana,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 50,
            iconEnabledColor: Color(0xff008080),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              color: primaryColor,
              fontSize: 22,
            ),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue;
              });
            },
            items: ListItem.map(
              (valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class District extends StatelessWidget {
  String valueChoose;
  String selectText;
  List ListItem = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        padding: EdgeInsets.only(left: 10, right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 2.0, color: primaryColor)),
        child: DropdownButton(
          hint: discrit,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 50,
          iconEnabledColor: primaryColor,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 22,
          ),
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
            });
          },
          items: ListItem.map(
            (valueItem) {
              return DropdownMenuItem(value: valueItem, child: Text(valueItem));
            },
          ).toList(),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
