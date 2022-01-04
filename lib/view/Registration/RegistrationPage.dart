import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/view/Registration/utils/bottom_title.dart';
import 'package:need_doctors/view/Registration/utils/logo.dart';
import 'package:need_doctors/view/Registration/utils/saveButton.dart';
import 'package:need_doctors/view/Registration/utils/buildText.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController orgController = TextEditingController();
  final TextEditingController bmdcRegController = TextEditingController();

  // Select Area
  String selectedItem, selectDis, selectThan, selectSpeciality;
  int distId;

  String _selectedDistrict; // Option 2
  int _selectedDistrictId;
  String userMail;

  List<DistrictLists> districtList =
      districtListsFromJson(jsonEncode(districtListJson));
  List<ThanaLists> thanaList = thanaListsFromJson(jsonEncode(thanaListJson));

  List<String> getThana(int id) {
    List<String> thanaS = [];
    for (int i = 0; i < thanaList.length; i++) {
      if (thanaList[i].districtId == id) {
        if (thanaList[i].name.isEmpty) {
          continue;
        }
        thanaS.add(thanaList[i].name);
      }
    }
    return thanaS;
  }

  String _selectedThana; // Option 2

  //agree checking:
  bool isChecked = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isGettingGmail = false;

  signinUser() async {
    setState(() {
      isGettingGmail = true;
    });

    try {
      GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();

      setState(() {
        userMail = _googleSignInAccount.email;
        if (userMail.isNotEmpty) {
          emailController.text = userMail;
        }

        setState(() {
          isGettingGmail = false;
        });
      });

      print(_googleSignInAccount.email);
    } catch (e) {
      setState(() {
        isGettingGmail = false;
      });
      sendToast("Please Try Again");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primarycolor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
            child: Column(
              children: [
                FadeAnimation(
                  1,
                  logoRegistration(size),
                ),

                SizedBox(
                  height: 15.0,
                ),
                //Textfeild setup:
                Column(
                  children: [
                    FadeAnimation(
                      1,
                      buildTextField(nameController, 'Name*', 'Enter Your Name',
                          TextInputType.name),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      1,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: buildTextField(emailController, 'Email*',
                                'Enter Your Email', TextInputType.emailAddress),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          isGettingGmail == false
                              ? IconButton(
                                  color: whitecolor,
                                  splashRadius: 30.0,
                                  icon: Icon(
                                    Icons.email,
                                    size: 35.0,
                                  ),
                                  onPressed: () {
                                    signinUser();
                                  },
                                )
                              : SizedBox(
                                  height: 27.0,
                                  width: 27.0,
                                  child: CircularProgressIndicator(
                                   // color: whitecolor,
                                  ),
                                ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      1,
                      buildTextField(phoneController, 'Phone*',
                          'Enter Your Phone', TextInputType.phone),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1,
                        Container(
                          height: 55.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: lightcolor,
                              border: Border.all(color: white)),
                          child: DropdownButton(
                            hint: sText("Select Your Occupation", primarycolor,
                                20, FontWeight.bold),
                            iconSize: 40,
                            dropdownColor: white,
                            isExpanded: true,
                            onChanged: (val) {
                              setState(() {
                                this.selectedItem = val;
                                print(selectedItem);
                              });
                            },
                            value: this.selectedItem,
                            items: occuptoinlist.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: sText(
                                    val, primarycolor, 18, FontWeight.bold),
                              );
                            }).toList(),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      1,
                      buildTextField(orgController, 'Organization',
                          'Enter Your Organization', TextInputType.text),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Visible/Invisible
                    Visibility(
                      visible: this.selectedItem == 'Doctor' ? true : false,
                      child: Container(
                        child: Column(
                          children: [
                            FadeAnimation(
                              1,
                              buildTextField(bmdcRegController, 'BMDC Reg*',
                                  'Enter Your BMDC Reg', TextInputType.number),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                              1,
                              specializationContainer(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                              1,
                              districtListDropDown(context),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                              1,
                              thanaListDropDown(context),
                            ),
                          ], //comment
                        ),
                      ),
                    )
                  ],
                ),

                //Set Agree
                FadeAnimation(
                  1,
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 1.0, right: 10.0),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: this.isChecked,
                          onChanged: (value) {
                            setState(() {
                              this.isChecked = value;
                              print(this.isChecked);
                            });
                          },
                        ),
                        Expanded(
                          child: mText(
                              'Are you agree with Need Doctor’s terms and condition?',
                              black,
                              13.0,
                              FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //Set Rigister Button:
                FadeAnimation(
                    1,
                    SaveButton(
                        nameController: nameController,
                        emailController: emailController,
                        phoneController: phoneController,
                        orgController: orgController,
                        bmdcRegController: bmdcRegController,
                        selectedItem: selectedItem,
                        distId: distId,
                        selectDis: _selectedDistrict,
                        selectThan: _selectedThana,
                        selectSpeciality: selectSpeciality,
                        isChecked: isChecked)),
                SizedBox(
                  height: 12.0,
                ),
                //Bottom_title
                regibottomTittle(context)
              ],
            ),
          ),
        ));
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      height: 55.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: primarycolor)),
      child: DropdownButton(
        isExpanded: true,
        iconSize: 40,
        dropdownColor: lightcolor,
        hint: sText('Please choose a Thana', primarycolor, 18, FontWeight.bold),
        // Not necessary for Option 1
        value: _selectedThana,
        onChanged: (newValue1) {
          setState(() {
            _selectedThana = newValue1;
          });
        },
        items: getThana(_selectedDistrictId).map((location2) {
          return DropdownMenuItem(
            child: Text(
              location2,
              style: GoogleFonts.quicksand(
                  color: primarycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            value: location2,
          );
        }).toList(),
      ),
    );
  }

  Container districtListDropDown(BuildContext context) {
    return Container(
      height: 55.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: primaryColor)),
      child: FittedBox(
        child: DropdownButton(
          iconSize: 40,
          dropdownColor: lightcolor,
          hint: sText(
              'Please choose a District', primarycolor, 18, FontWeight.bold),
          // Not necessary for Option 1
          value: _selectedDistrict,
          onChanged: (newValue) {
            setState(() {
              _selectedDistrict = newValue;
              _selectedThana = null;

              for (int i = 0; i < districtList.length; i++) {
                if (districtList[i].name == newValue) {
                  _selectedDistrictId = districtList[i].id;
                }
              }
            });
          },
          items: districtList.map((location) {
            return DropdownMenuItem(
              child: new Text(
                location.name,
                style: GoogleFonts.quicksand(
                    color: primarycolor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              value: location.name,
            );
          }).toList(),
        ),
      ),
    );
  }

  Container specializationContainer() {
    return Container(
      height: 55.0,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: white)),
      child: DropdownButton(
        hint:
            sText("Select Your Speciality", primarycolor, 18, FontWeight.bold),
        iconSize: 40,
        dropdownColor: white,
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            this.selectSpeciality = val;
          });
        },
        value: this.selectSpeciality,
        items: specializationList.map(
          (val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val,
                style: GoogleFonts.quicksand(
                    color: primarycolor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container DistrctDropDown() {
    return Container(
      height: 55.0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: white)),
      child: DropdownButton(
        hint:
            sText("Select Your District", primarycolor, 10, FontWeight.normal),
        iconSize: 40,
        dropdownColor: primaryLight,
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            this.selectDis = val;

            Map<String, dynamic> disInfo = findFromDistrict(val);

            this.distId = disInfo['id'];
            print(distId.runtimeType);
          });
        },
        value: this.selectDis,
        items: districtListJson.map((val) {
          return DropdownMenuItem(
            value: val['name'],
            child: Text(
              val['name'],
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }
}

Object findFromDistrict(String value) {
  var data = districtListJson.where((row) => (row["name"].contains(value)));
  if (data.length >= 1) {
    return data.single;
  } else {
    return null;
  }
}
