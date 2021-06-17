import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
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
  var selectedItem, selectDis, selectThan, selectSpeciality;
  int distId;

  String _selectedDistrict; // Option 2
  int _selectedDistrictId;

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primarycolor,
        body: SafeArea(
          child: Container(
            child: SafeArea(
              child: SingleChildScrollView(
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
                    Container(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            FadeAnimation(
                              1,
                              buildTextField(
                                  nameController, 'Name*', 'Enter Your Name'),
                              ),
                            SizedBox(
                              height: 10,
                              ),
                            FadeAnimation(
                              1,
                              buildTextField(emailController, 'Email*',
                                                 'Enter Your Email'),
                              ),
                            SizedBox(
                              height: 10,
                              ),
                            FadeAnimation(
                              1,
                              buildTextField(phoneController, 'Phone*',
                                                 'Enter Your Phone'),
                              ),
                            SizedBox(
                              height: 10,
                              ),
                            FadeAnimation(
                                1,
                                Container(
                                  height: 65.0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: lightcolor,
                                      border:
                                      Border.all(color: white)),
                                  child: DropdownButton(
                                    hint: sText("Select Your Occupation", primarycolor, 20, FontWeight.bold),
                                    iconSize: 40,
                                    dropdownColor: white,
                                    isExpanded: true,
                                    onChanged: (val) {
                                      setState(() {
                                        this.selectedItem = val;
                                      });
                                    },
                                    value: this.selectedItem,
                                    items: occuptoinlist.map((val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: sText(
                                          val, primarycolor, 18, FontWeight.bold
                                          ),
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
                                                 'Enter Your Organization'),
                              ),
                            SizedBox(
                              height: 10,
                              ),
                            //Visible/Invisible
                            Visibility(
                              visible:
                              this.selectedItem == 'Doctor' ? true : false,
                              child: Container(
                                child: Column(
                                  children: [
                                    FadeAnimation(
                                      1,
                                      buildTextField(bmdcRegController,
                                                         'BMDC Reg*', 'Enter Your BMDC Reg'),
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
                        ),
                      ),

                    //Set Agree
                    FadeAnimation(
                      1,
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 1.0, right: 10.0),
                        height: 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            sText('Are you agree with Need Doctor’s terms and condition?', black, 13.0, FontWeight.bold),
                          ],
                          ),
                        ),
                      ),
                    //Set Rigister Button:
                    FadeAnimation(
                      1,
                      SaveButton()
                      ),
                    SizedBox(
                      height: 12.0,
                      ),
                    //Bottom_title
                    regibottomTittle(context)
                  ],
                  ),
                ),
              ),
            ),
          ));
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: black)),
      child: DropdownButton(
        isExpanded: true,
        iconSize: 40,
        dropdownColor: lightcolor,
        hint: sText(
          'Please choose a Thana', primarycolor, 18, FontWeight.bold
          ),
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
              style: TextStyle(color: primarycolor, fontSize: 20),
              ),
            value: location2,
            );
        }).toList(),
        ),
      );
  }

  Container districtListDropDown(BuildContext context) {
    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: Color(0xff00BAA0))),
      child: FittedBox(
        child: DropdownButton(
          iconSize: 40,
          dropdownColor: lightcolor,
          hint: sText(
            'Please choose a District',
            primarycolor, 18, FontWeight.bold
            ),
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
                style: TextStyle(color: primarycolor, fontSize: 20),
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
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: white)),
      child: DropdownButton(
        hint: sText("Select Your Speciality",
                      primarycolor, 18, FontWeight.bold),
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
                style: TextStyle(color: primarycolor, fontSize: 20),
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
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: white)),
      child: DropdownButton(
        hint: sText("Select Your District",primarycolor, 10, FontWeight.normal),
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

