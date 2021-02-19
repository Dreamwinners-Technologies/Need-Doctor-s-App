import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Registration/RegistrationRequestModel.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/LoginRegistrationNetwork.dart';
import 'package:need_doctors/view/SplashScreen.dart';

import '../models/StaticData/DistrictListRaw.dart';
import 'OtpPage.dart';

class RegiPage extends StatefulWidget {
  @override
  _RegiPageState createState() => _RegiPageState();
}

class _RegiPageState extends State<RegiPage> {
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
    return Scaffold(
      body: CustomPaint(
          painter: BluePainter(),
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FadeAnimation(
                        1,
                        Image.asset('asset/logog.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(
                            1,
                            Text(
                              'Needs',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff00BAA0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FadeAnimation(
                            1,
                            Text(
                              'Doctor',
                              style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      FadeAnimation(
                        1,
                        Text(
                          'Create Your Account',
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      //Textfeild setup:
                      Container(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        // height: MediaQuery.of(context).size.height / 2,
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
                                        color: Color(0xff00BAA0),
                                        border: Border.all(
                                            color: Color(0xff00BAA0))),
                                    child: DropdownButton(
                                      hint: Text("Select Your Occupation",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                      iconSize: 40,
                                      dropdownColor: primaryLight,
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
                                          child: Text(
                                            val,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
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
                                visible: this.selectedItem == 'Doctor'
                                    ? true
                                    : false,
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
                          margin: EdgeInsets.only(top: 10.0,right: 12.0),
                          height: 57.0,
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
                              Text(
                                "Are you agree with Need Doctor’s terms and \ncondition?",
                                style: TextStyle(fontSize: 15.0),
                              ),

                            ],
                          ),
                        ),
                      ),
                      //Set Rigister Button:
                      FadeAnimation(
                        1,
                        MaterialButton(
                          minWidth: 100,
                          height: 35,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0))),
                          onPressed: () async {
                            List<String> role = [];

                            if (selectedItem == "Doctor") {
                              role.add("DOCTOR");
                            } else {
                              role.add("USER");
                            }

                            RegistrationRequestModel registrationModel =
                                RegistrationRequestModel(
                                    name: nameController.text,
                                    phoneNo: phoneController.text,
                                    role: role,
                                    bmdcRegistrationNo: bmdcRegController.text,
                                    specialization: selectSpeciality,
                                    thana: selectThan,
                                    district: selectDis);

                            int statusCode = await attemptRegister(
                                requestModel: registrationModel);

                            print(statusCode);

                            if (statusCode == 201) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OtpScreen(registrationModel.phoneNo),
                                ),
                              );
                            } else {
                              sendToast("Please Try Again");
                            }
                          },
                          color: white,
                          child: Text('Save',
                              style: TextStyle(
                                  color: Color(0xff008080),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FadeAnimation(
                              1,
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Already Have Account?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              1,
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Color(0xff00BAA0), fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width ,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xff00BAA0),
          border: Border.all(color: Color(0xff00BAA0))),
      child: DropdownButton(
        iconSize: 40,
        dropdownColor: Color(0xff00BAA0),
        hint: Text(
          'Please choose a Thana',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
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
              style: TextStyle(color: Colors.white, fontSize: 20),
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
      width: MediaQuery.of(context).size.width ,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xff00BAA0),
          border: Border.all(color: Color(0xff00BAA0))),
      child: DropdownButton(
        iconSize: 40,
        dropdownColor: Color(0xff00BAA0),
        hint: Text(
          'Please choose a District',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            value: location.name,
          );
        }).toList(),
      ),
    );
  }

  Container specializationContainer() {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xff00BAA0),
          border: Border.all(color: Color(0xff00BAA0))),
      child: DropdownButton(
        hint: Text("Select Your Speciality",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        iconSize: 40,
        dropdownColor: Color(0xff00BAA0),
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            this.selectSpeciality = val;
          });
        },
        value: this.selectSpeciality,
        items: specalizationlist.map(
          (val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val,
                style: TextStyle(color: Colors.white, fontSize: 20),
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
          color: Color(0xff00BAA0),
          border: Border.all(color: Color(0xff00BAA0))),
      child: DropdownButton(
        hint: Text("Select Your District",
            style: TextStyle(color: Colors.white, fontSize: 20)),
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
        // items: districtlist.map((val) {
        //   return DropdownMenuItem(
        //     value: val,
        //     child: Text(
        //       val,
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 20),
        //     ),
        //   );
        // }).toList(),
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

  // Container specializationContainer() {
  //   return Container(
  //     height: 65.0,
  //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //         color: Color(0xff00BAA0),
  //         border: Border.all(color: Color(0xff00BAA0))),
  //     child: DropdownButton(
  //       hint: Text("Select Your Speciality",
  //           style: TextStyle(color: Colors.white, fontSize: 20)),
  //       iconSize: 40,
  //       dropdownColor: primaryLight,
  //       isExpanded: true,
  //       onChanged: (val) {
  //         setState(() {
  //           this.selectSpeciality = val;
  //         });
  //       },
  //       value: this.selectSpeciality,
  //       items: specalizationlist.map(
  //         (val) {
  //           return DropdownMenuItem(
  //             value: val,
  //             child: Text(
  //               val,
  //               style: TextStyle(color: Colors.white, fontSize: 20),
  //             ),
  //           );
  //         },
  //       ).toList(),
  //     ),
  //   );
  // }
}

Object findFromDistrict(String value) {
  var data = districtListJson.where((row) => (row["name"].contains(value)));
  if (data.length >= 1) {
    return data.single;
  } else {
    return null;
  }
}

// Object findFromDistrict(String value) {
//   var data = districtListJson.where((row) => (row["name"].contains(value)));
//   if (data.length >= 1) {
//     return data.single;
//   } else {
//     return null;
//   }
// }