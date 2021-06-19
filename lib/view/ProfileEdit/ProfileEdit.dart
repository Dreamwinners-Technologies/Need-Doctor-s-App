import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/Profile/ProfileResponse.dart';
import 'package:need_doctors/networking/ProfileNetwork.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/ProfileEdit/utils/districtDropdown.dart';
import 'package:need_doctors/view/ProfileEdit/utils/thanaDropdown.dart';
import 'package:need_doctors/view/ProfileEdit/utils/buildTextField.dart';
import 'package:need_doctors/view/ProfileEdit/utils/updateButton.dart';

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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bmdcController = TextEditingController();
  final TextEditingController speciaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: editprofile),
        body: FadeAnimation(1,
            profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return ListView(
      padding: editfieldpadding,
      children: <Widget>[
        //TextField
        buildTextField1(nameController, drname),
        buildTextField1(bmdcController, bmdc),
        buildTextField1(speciaController, spacalization),
        buildTextField1(phoneController, phone),
        SizedBox(
          height: 10,
        ),
        DistrictDrop(),
        SizedBox(
          height: 10,
        ),
        thanaDrops(),

        //Update_button
        FadeAnimation(
          1.2,
          updateButton(),
        ),
      ],
    );
  }
}
