import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Card/OwnCardEditRequest.dart';
import 'package:need_doctors/models/Card/OwnCardResponse.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/CardNetwork.dart';

import 'AddVisitingCard/utils/image_gallaryBtn.dart';
import 'AddVisitingCard/utils/imagebox.dart';
import 'AddVisitingCard/utils/textFieled.dart';

// ignore: must_be_immutable
class AddOwnCardPage extends StatefulWidget {
  AddOwnCardPage(CardInfoResponse ownCardResponse) {
    this.ownCardResponse = ownCardResponse;
  }

  CardInfoResponse ownCardResponse;

  @override
  _AddOwnCardPageState createState() => _AddOwnCardPageState(ownCardResponse);
}

class _AddOwnCardPageState extends State<AddOwnCardPage> {


  final TextEditingController nameController = TextEditingController();
  final TextEditingController appointController = TextEditingController();
  final TextEditingController ocrController = TextEditingController();
  var selectSpeciality, selectThan, selectDis, distId, thanaId;

  String _selectedDistrict; // Option 2
  int _selectedDistrictId;


  final _specializaionItems = specializationList
      .map((item) => MultiSelectItem<String>(item, item))
      .toList();
  List<String> _selectedSpecializations = [];

  List<DistrictLists> districtList =
  districtListsFromJson(jsonEncode(districtListJson));
  List<ThanaLists> thanaList = thanaListsFromJson(jsonEncode(thanaListJson));

  _AddOwnCardPageState(CardInfoResponse ownCardResponse) {
    this.ownCardResponse = ownCardResponse;
    nameController.text = ownCardResponse.name;
    _selectedDistrict = ownCardResponse.district;
    selectSpeciality = ownCardResponse.specialization;
    _selectedThana = ownCardResponse.thana;
  }

  CardInfoResponse ownCardResponse;

  get isFalse => null;

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

  int getThanaThana(String id) {
    // ignore: unused_local_variable
    List<String> thanaS = [];
    for (int i = 0; i < thanaList.length; i++) {
      if (thanaList[i].name == id) {
        return thanaList[i].districtId;
      }
    }
    return null;
  }

  String _selectedThana; // Option 2

  //Image Picking:
  File _image;

  Future imagepick(ImageSource source) async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
      source: source,
      maxHeight: 600,
      maxWidth: 1000,
    );
    if (image != null) {
      cropimage(image);
    }
  }

  Future cropimage(File file) async {
    File cropped = await ImageCropper.cropImage(
        androidUiSettings: AndroidUiSettings(
            statusBarColor: primaryColor,
            toolbarColor: primaryColor,
            toolbarTitle: 'Crope Image'),
        sourcePath: file.path,
        maxHeight: 600,
        maxWidth: 1000,
        aspectRatio: CropAspectRatio(ratioX: 10, ratioY: 6));
    if (cropped != null) {
      setState(() {
        _image = cropped;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //image
            imageBox(_image, context),

            //Button
            cameraGallarybtn(context, imagepick),
            Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset(0.1, 0.2),
                  child: sText(
                      "Card Information", primarycolor, 19.0, FontWeight.bold),
                )
              ],
            ),
            FadeAnimation(
              1,
              buildTextField1(nameController, 'Dr. Name', context),
            ),
            FadeAnimation(
              1,
              buildTextField1(appointController, 'Appointment No', context),
            ),
            FadeAnimation(
                1,
                // specializationContainer(),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // color: Color(0xff00BAA0),
                      // color: Colors.white,
                      border: Border.all(width: 1.0, color: Color(0xffe7e7e7))),
                  child: MultiSelectDialogField(
                    // items: _items,
                    items: _specializaionItems,
                    title: sText(
                      // "Select Your Speciality", Colors.black54, 17.0, FontWeight.w700),
                        "Select Your Speciality",
                        primarycolor,
                        17.0,
                        FontWeight.w700),
                    selectedColor: primarycolor,
                    buttonText: sText("Select Your Speciality", primarycolor,
                        17.0, FontWeight.w700),
                    onConfirm: (results) {
                      setState(() {
                        _selectedSpecializations = results.cast();
                      });
                    },
                  ),
                )),
            FadeAnimation(
              1,
              // DistrctDropDown(),
              districtListDropDown(context),
            ),
            FadeAnimation(
              1,
              // ThanaDropDown(),
              thanaListDropDown(context),
            ),
            FadeAnimation(
              1,
              buildTextField2(ocrController, 'Scanned Text', context),
            ),
            SizedBox(
              height: 6,
            ),
            FadeAnimation(
              1,
              MaterialButton(
                minWidth: 100,
                height: 35,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24.0))),
                onPressed: () async {
                  // RoundedRectangleBorder(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(24.0)));

                  if (_image == null) {
                    sendToast("Please Select Image First");

                    //  throw new Exception("Please Select Image First");
                  } else if (nameController.text.isEmpty) {
                    sendToast("Name can't be empty");
                    //   throw new Exception("Field Cant be empty");
                  } else if (appointController.text.isEmpty) {
                    sendToast("Appointment No can't be empty");
                    //  throw new Exception("Appointment Cant be empty");
                  } else if (_selectedThana == null ||
                      _selectedSpecializations.isEmpty ||
                      _selectedDistrict == null) {
                    sendToast("Select Item");
                    // throw new Exception("Fields can't be empty");
                  } else {
                    askDialog(
                      context,
                      "Alert",
                      'Do you wants to add those info?',
                      DialogType.WARNING,
                          () {
                        if (isFalse != null && !isFalse) {
                          sendToast("Data Sent To Admin for approval");
                          Navigator.pop(context);
                          Navigator.pop(context);
                          throw new Exception("Admin");
                        }

                        // savevisiting();
                      },
                    );
                  }
                },
                color: primarycolor,
                child: sText("Save", whitecolor, 25.0, FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }


  Container thanaListDropDown(BuildContext context) {
    return Container(
      height: 65.0,
      width: MediaQuery
          .of(context)
          .size
          .width * .9,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 2.0, color: primaryColor),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        iconSize: 40,
        hint: Text(
          'Please choose a Thana',
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
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
              style: TextStyle(color: Colors.grey, fontSize: 18),
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
      width: MediaQuery
          .of(context)
          .size
          .width * .9,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 2.0, color: primaryColor),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        iconSize: 40,
        hint: Text(
          'Please choose a District',
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
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
              style: TextStyle(color: Colors.grey, fontSize: 18),
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
          // color: Color(0xff00BAA0),
          // color: Colors.white,
          border: Border.all(width: 2.0, color: Color(0xff008080))),
      child: DropdownButton(
        underline: SizedBox(),
        hint: Text("Select Your Speciality",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        iconSize: 40,
        dropdownColor: Colors.white,
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
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

_buildTextField1(TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2.0, color: Color(0xff008080))),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Color(0xff008080)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
          border: InputBorder.none),
    ),
  );
}
