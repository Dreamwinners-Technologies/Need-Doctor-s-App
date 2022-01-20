// ignore_for_file: unused_field

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/bottomsheet.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Profile/profile_model.dart';
import 'package:need_doctors/networking/ProfileNetwork.dart';
import 'package:need_doctors/networking/UserNetworkHolder.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/ProfileEdit/utils/buildTextField.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

// ignore: must_be_immutable
class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key key, this.profileModel, this.userType}) : super(key: key);
  ProfileModel profileModel;
  String userType;

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool isEdited = true;

  @override
  void initState() {
    super.initState();
    print(widget.userType);
    print(widget.profileModel.thana);

    nameController.text = widget.profileModel.name;
    designationController.text = widget.profileModel.designation;
    emailController.text = widget.profileModel.email;
    specalizationController.text = widget.profileModel.specialization;
    organizationController.text = widget.profileModel.organization;
    bmdcRegNoController.text =
        widget.profileModel.bmdcRegistrationNo.toString();
    thanaController.text = widget.profileModel.thana;
    pinController.text = widget.profileModel.pinNo.toString();
    designationController.text = widget.profileModel.designation;
    qualificationController.text = widget.profileModel.qualification;
    distictController.text = widget.profileModel.district;
  }

  bool _status = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController thanaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController distictController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController specalizationController = TextEditingController();
  TextEditingController bmdcRegNoController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController pinController = TextEditingController();

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
              buildTextField(
                  "Name", widget.profileModel.name, false, nameController),
              buildTextField(
                  "Email", widget.profileModel.email, false, emailController),
              buildTextField("Organization", widget.profileModel.organization,
                  true, organizationController),
              widget.userType.contains('DOCTOR')
                  ? buildTextField(
                      "Designation",
                      widget.profileModel.designation,
                      false,
                      designationController)
                  : Container(),
              widget.userType.contains('DOCTOR')
                  ? buildTextField(
                      "Speciality",
                      widget.profileModel.specialization,
                      false,
                      specalizationController)
                  : Container(),
              widget.userType.contains('DOCTOR')
                  ? buildTextField(
                      "BMDC Registration No",
                      widget.profileModel.bmdcRegistrationNo.toString(),
                      false,
                      bmdcRegNoController)
                  : Container(),
              widget.userType.contains('DOCTOR')
                  ? buildTextField(
                      "Qualification",
                      widget.profileModel.qualification,
                      false,
                      qualificationController)
                  : Container(),
              widget.userType.contains('DOCTOR')
                  ? buildTextField("District", widget.profileModel.district,
                      false, distictController)
                  : Container(),
              widget.userType.contains('DOCTOR')
                  ? buildTextField("Thana", widget.profileModel.thana, false,
                      thanaController)
                  : Container(),
              buildTextField("Pin", widget.profileModel.pinNo.toString(), false,
                  pinController),
              //Update_button
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        child: sText("Save", white, 18, FontWeight.bold),
                        textColor: Colors.white,
                        color: primarycolor,
                        onPressed: () async {
                          ProfileModel editedData;

                          if (nameController.text.isEmpty) {
                            customDialog(context, "Empty",
                                "Please Enter Your Name", DialogType.ERROR);
                          } else if (emailController.text.isEmpty) {
                            customDialog(context, "Empty",
                                "Please Enter Your Email", DialogType.ERROR);
                          } else if (organizationController.text.isEmpty) {
                            customDialog(context, "Empty",
                                "Please Enter Organization", DialogType.ERROR);
                          } else if (pinController.text.isEmpty) {
                            customDialog(context, "Empty", "Please Enter Pin",
                                DialogType.ERROR);
                          } else {
                            customBottomSheet(context, "Please Wait...");
                            if (widget.userType == 'USER') {
                              editedData = ProfileModel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  organization: organizationController.text,
                                  pinNo: int.parse(pinController.text),
                                  bmdcRegistrationNo: '',
                                  thana: '',
                                  designation: '',
                                  district: '',
                                  qualification: '',
                                  specialization: '');
                            } else if (widget.userType.contains('DOCTOR')) {
                              if (bmdcRegNoController.text.isEmpty) {
                                customDialog(
                                    context,
                                    "Empty",
                                    "Please Enter BMDC Reg No",
                                    DialogType.ERROR);
                              } else if (specalizationController.text.isEmpty) {
                                customDialog(
                                    context,
                                    "Empty",
                                    "Please Select Your Speciality",
                                    DialogType.ERROR);
                              } else if (designationController.text.isEmpty) {
                                customDialog(
                                    context,
                                    "Empty",
                                    "Please Select Your Speciality",
                                    DialogType.ERROR);
                              } else if (qualificationController.text.isEmpty) {
                                customDialog(
                                    context,
                                    "Empty",
                                    "Please Select Your Qualification",
                                    DialogType.ERROR);
                              } else if (distictController.text.isEmpty) {
                                customDialog(
                                    context,
                                    "Empty",
                                    "Please Select Your District",
                                    DialogType.ERROR);
                              } else if (thanaController.text.isEmpty) {
                                customDialog(
                                    context,
                                    "Empty",
                                    "Please Select Your Thana",
                                    DialogType.ERROR);
                              } else {
                                customBottomSheet(context, "Please Wait...");

                                editedData = ProfileModel(
                                    name: nameController.text,
                                    district: distictController.text,
                                    email: emailController.text,
                                    organization: organizationController.text,
                                    pinNo: int.parse(pinController.text),
                                    bmdcRegistrationNo:
                                        bmdcRegNoController.text,
                                    thana: thanaController.text,
                                    designation: designationController.text,
                                    qualification: qualificationController.text,
                                    specialization:
                                        specalizationController.text);
                              }
                            }

                            // print(editedData.toString());
                            var message = await editProfile(data: editedData);
                            if (message.message != 'Profile Edit Successful') {
                              sendToast("Something Wrong -!");
                            }
                            await storage.delete(key: profileJson);
                            await getUsers();
                            Navigator.pop(context);
                            Navigator.pop(context);

                            print(message.message);

                            setState(
                              () {
                                _status = true;
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
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
