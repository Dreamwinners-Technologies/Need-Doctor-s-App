import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/District/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/District/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionModel.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaLists.dart';
import 'package:need_doctors/models/ambulance/AddAmbulanceRequest.dart';
import 'package:need_doctors/networking/ambulance_service/addAmbulance_service.dart';
import 'package:need_doctors/view/AddAmbulance/utils/textFieldWidget.dart';
import 'package:need_doctors/view/AddAmbulance/utils/textfrombox.dart';

// ignore: must_be_immutable
class AddAmbulance extends StatefulWidget {
//  AddAmbulance(bool isWork) {
  //   this.isWork = isWork;
  // }
  bool isWork;

  @override
  _AddAmbulanceState createState() => _AddAmbulanceState(isWork);
}

class _AddAmbulanceState extends State<AddAmbulance> {
  _AddAmbulanceState(bool isWork) {
    this.isWork = isWork;
  }

  bool isWork;

  //all info controller
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  String valueChoice;

  String _selectedDivision, _selectedDistrict, _selectedThana; // Option 2
  int _selectedDistrictId;

  List<DivisionLists> divisionList =
      divisionListJsonFromJson(jsonEncode(divisionListJson));

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

  List<String> getDistrict(int id) {
    List<String> disS = [];
    for (int i = 0; i < districtList.length; i++) {
      if (districtList[i].id == id) {
        if (districtList[i].name.isEmpty) {
          continue;
        }
        disS.add(districtList[i].name);
      }
    }

    return disS;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    nameController.clear();
                    phoneController.clear();
                    titleController.clear();
                    _selectedDistrict = null;
                    _selectedDivision = null;
                    _selectedThana = null;
                  });
                },
                icon: Icon(Icons.refresh))
          ],
          elevation: 0.0,
          backgroundColor: primaryColor,
          title: sText("Add Ambulance", whitecolor, 19.0, FontWeight.bold)),
      body: profileView(size),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView(Size size) {
    return Container(
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sText("Enter all the require information", greylightColor,
                      19.0, FontWeight.bold)
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Image(image: AssetImage("asset/ambulance.png",
            //   ),width: 220,
            //   height: 200,
            //   fit: BoxFit.fill,),
            // ),
            SizedBox(
              height: 15.0,
            ),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Row(
                  children: [
                    divisionListDropDown(context),
                    districtListDropDown(context),
                    thanaListDropDown(context)
                  ],
                )),
            textBox(
                context: context,
                label: "Driver Name",
                hint: "Enter Driver Name",
                textController: nameController),
            textBox(
                context: context,
                label: "Phone No",
                hint: "Enter Phone Number",
                textController: phoneController),
            textBox(
                context: context,
                label: "Title",
                hint: "Enter Title",
                textController: titleController),

            //Slecte Item:
            /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dropDownBox(),
                Expanded(
                    child: textBox(
                        context: context,
                        label: "Pack Size",
                        hint: "Pack Size",
                        boxSize: null,
                        textController: packSizeController)),
              ],
            ),*/

            //Save Button
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                minWidth: 120,
                height: 40.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () async {
                  print("tap");

                  if (_selectedDivision == null ||
                      _selectedDistrict == null ||
                      _selectedThana == null) {
                    sendToast('Please select address');
                  } else if (nameController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      titleController.text.isEmpty) {
                    sendToast('Field cannot be empty');
                  } else if (phoneController.text.length != 11) {
                    sendToast('Please enter a valid phone number');
                  } else {
                    saveAmbulance();
                  }
                },
                color: primarycolor,
                child: sText("Save", white, 23.0, FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //You can change here , just copy/paste
  //Save Ambulance
  saveAmbulance() {
    askDialog(context, "Warning", 'Do You want to add this Ambulance?',
        DialogType.WARNING, () async {
      AddAmbulanceRequest addAmbulanceRequest = AddAmbulanceRequest(
        name: nameController.text,
        phone: phoneController.text,
        title: titleController.text,
        division: _selectedDivision,
        district: _selectedDistrict,
        thana: _selectedThana,
      );

      MessageIdResponse messageIdResponse =
          await addAmbulance(addAmbulanceRequest: addAmbulanceRequest)
              .whenComplete(() {
        Navigator.pop(context);
        // sendToast("Ambulance Added ):");
      });

      if (messageIdResponse.message == 'Ambulance created successfully') {
        setState(() {
          nameController.clear();
          phoneController.clear();
          titleController.clear();
          _selectedDistrict = null;
          _selectedDivision = null;
          _selectedThana = null;
        });
      }

      print(messageIdResponse.message);
      sendToast(messageIdResponse.message);
    });
  }

  divisionListDropDown(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 5),
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          iconSize: 40.0,
          underline: SizedBox(),
          hint: sText('Division', greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedDivision,
          onChanged: (newValue1) {
            setState(() {
              _selectedDivision = newValue1;
              // _selectedDistrict = null;
              if (newValue1 != null) {
                // _pagingController.refresh();
              }

              for (int i = 0; i < divisionList.length; i++) {
                if (divisionList[i].name == newValue1) {}
              }
            });
          },
          items: divisionList.map((location) {
            return DropdownMenuItem(
              value: location.name,
              child: Text(
                location.name,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  thanaListDropDown(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 5.0,
        ),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, right: 5),
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          underline: SizedBox(),
          iconSize: 40,
          hint: sText('Thana', greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedThana,
          onChanged: (newValue2) {
            setState(() {
              print(newValue2);
              _selectedThana = newValue2;
              if (_selectedThana != null) {
                //  _pagingController.refresh();
              }
            });
          },
          items: getThana(_selectedDistrictId).map((location2) {
            return DropdownMenuItem(
              child: Text(
                location2,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              value: location2,
            );
          }).toList(),
        ),
      ),
    );
  }

  districtListDropDown(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, right: 5, left: 5),
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          iconSize: 40.0,
          underline: SizedBox(),
          hint: sText('District', greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedDistrict,
          onChanged: (newValue3) {
            setState(() {
              _selectedDistrict = newValue3;
              _selectedThana = null;
              if (newValue3 != null) {
                // _pagingController.refresh();
              }

              for (int i = 0; i < districtList.length; i++) {
                if (districtList[i].name == newValue3) {
                  _selectedDistrictId = districtList[i].id;
                }
              }
            });
          },
          items: districtList.map((location) {
            return DropdownMenuItem(
              value: location.name,
              child: Text(
                location.name,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
