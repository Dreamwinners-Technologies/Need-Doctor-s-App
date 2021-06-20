import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/models/Profile/ProfileResponse.dart';
import 'package:need_doctors/networking/ProfileNetwork.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/ProfileEdit/utils/buildTextField.dart';
import 'package:need_doctors/view/ProfileEdit/utils/updateButton.dart';

class ProfileEdit extends StatefulWidget {
  bool showPassword = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: editprofile),
        body: FadeAnimation(1,
            profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              //Textfield
              buildTextField("Name", "", false),
              buildTextField("Email", "", false),
              buildTextField("Phone", "", false),
              buildTextField("Speciality", "", false),
              buildTextField("Organization", "", true),
              buildTextField("Address", "", false),
              //Update_button
              updateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
