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
import 'package:need_doctors/models/StaticData/District/DistrictModel.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionModel.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaModel.dart';
import 'package:need_doctors/models/ambulance/AddAmbulanceRequest.dart';
import 'package:need_doctors/networking/ambulance_service/addAmbulance_service.dart';
import 'package:need_doctors/view/AddAmbulance/utils/textFieldWidget.dart';

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

  String valueChoice; // Option 2

  // List<DistrictLists> districtList = districtListsFromJson(jsonEncode(districtListJson));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
          actions: [
            // IconButton(
            //     onPressed: () {
            //       setState(() {
            //         nameController.clear();
            //         phoneController.clear();
            //         titleController.clear();
            //         _selectedDistrict = null;
            //         _selectedDivision = null;
            //         _selectedThana = null;
            //       });
            //     },
            //     icon: Icon(Icons.refresh))
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
                  // children: [divisionListDropDown(context), districtListDropDown(context), thanaListDropDown(context)],
                  children: [
                    customDropDown(context, _selectedDivision,
                        divisionModelList, onDivisionChange, "Division"),
                    customDropDown(context, _selectedDistrict, districtModels,
                        onDistrictChange, "District"),
                    customDropDown(context, _selectedThana, thanaModels,
                        onThanaChange, "Thana")
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
        driverName: nameController.text,
        phoneNo: phoneController.text,
        title: titleController.text,
        division: _selectedDivision,
        district: _selectedDistrict,
        upazila: _selectedThana,
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

  String _selectedDivision, _selectedDistrict, _selectedThana;

  List<DivisionModel> divisionModelList =
      divisionListJsonFromJson(jsonEncode(divisionListJson));
  List<DistrictModel> districtModelList =
      districtModelsFromJson(jsonEncode(districtListJson));
  List<ThanaModel> thanaModelList =
      thanaListsFromJson(jsonEncode(thanaListJson));

  List<ThanaModel> thanaModels = [];
  List<DistrictModel> districtModels = [];

  customDropDown(BuildContext context, _selectedData, List<dynamic> itemList,
      onChangeMethod, String hintText) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 5),
        height: 42.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          iconSize: 40.0,

          underline: SizedBox(),
          hint: sText(hintText, greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedData,
          onChanged: onChangeMethod,
          items: itemList.map((item) {
            return DropdownMenuItem(
              value: item.name,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.black,//Colors.grey,
                    // fontSize: 18,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void onDivisionChange(dropDownValue) {
    print(dropDownValue);
    setState(() {
      _selectedDivision = dropDownValue;
      _selectedDistrict = null;
      _selectedThana = null;

      String divisionName = dropDownValue;
      DivisionModel division = new DivisionModel();

      divisionModelList.forEach((element) {
        if (element.name == divisionName) {
          division = element;
        }
      });

      districtModels = [];
      districtModelList.forEach((element) {
        if (element.divisionId == division.id) {
          districtModels.add(element);
        }
      });
    });
  }

  void onThanaChange(dropDownValue) {
    setState(() {
      print(dropDownValue);
      _selectedThana = dropDownValue;
      if (_selectedThana != null) {
        //  _pagingController.refresh();
      }
    });
  }

  void onDistrictChange(dropDownValue) {
    setState(() {
      _selectedDistrict = dropDownValue;
      _selectedThana = null;

      String districtName = dropDownValue;
      DistrictModel district = new DistrictModel();
      districtModelList.forEach((element) {
        if (element.name == districtName) {
          district = element;
        }
      });

      thanaModels = [];

      thanaModelList.forEach((element) {
        if (element.districtId == district.id) {
          thanaModels.add(element);
        }
      });
    });
  }
}
