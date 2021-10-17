import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/bottomsheet.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/AddVisitingCard/utils/image_gallaryBtn.dart';
import 'package:need_doctors/view/AddVisitingCard/utils/imagebox.dart';
import 'package:need_doctors/view/AddVisitingCard/utils/textFieled.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';
import 'package:image/image.dart' as imageResize;

class AddCardPagePublic extends StatefulWidget {
  AddCardPagePublic({
    Key key,
  });

  bool isFalse;
  @override
  _AddCardPagePublicState createState() => _AddCardPagePublicState();
}

class _AddCardPagePublicState extends State<AddCardPagePublic> {
  _AddCardPagePublicState({
    Key key,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController appointController = TextEditingController();
  final TextEditingController ocrController = TextEditingController();
  var selectSpeciality, selectThan, selectDis, distId, thanaId;

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

  //Image Picking:
  File _image;

  Future imagepick(ImageSource source) async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
      source: source,
      // maxHeight: 600,
      // maxWidth: 1000,
      // maxHeight: 1800,
      // maxWidth: 3000,
    );
    if (image != null) {
      cropimage(image);
    }
  }

  String ocrText;

  Future cropimage(File file) async {
    File cropped = await ImageCropper.cropImage(
        androidUiSettings: AndroidUiSettings(
            statusBarColor: primaryColor,
            toolbarColor: primaryColor,
            cropFrameColor: primaryColor,
            toolbarTitle: 'Crop Image'),
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 10, ratioY: 6));
    if (cropped != null) {
      setState(() {
        _image = cropped;
      });
    }
    print('Reading Text');
    // sendToast('Reading Info From Card. Please Wait...');
    customBottomSheet(context, "Reading...");
    try {
      String ocrText =
          await TesseractOcr.extractText(_image.path, language: 'Bengali');
      print(ocrText);
      ocrController.text = ocrText;

      String testData = ocrController.text;
      int startsFrom, endTo;
      for (int i = 0; i < testData.length; i++) {
        if (testData[i] == 'ড' &&
            testData[i + 1] == 'া' &&
            testData[i + 2] != 'য়') {
          startsFrom = i;
          for (int j = i; j < testData.length; j++) {
            if (testData[j] == '\n') {
              endTo = j;
              break;
            }
          }
          break;
        }
      }
      String drName;
      if (startsFrom == null || endTo == null) {
        sendToast('Doctor name is not readable');
      } else {
        drName = testData.substring(startsFrom, endTo);
      }

      print(drName);

      nameController.text = drName;
      Navigator.pop(context);
      customDialog(context, "Congress", "Visiting card readed successfully",
          DialogType.SUCCES);
      // sendToast('Data Reading Complete.');
    } catch (e) {
      Navigator.pop(context);
      sendToast(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primarycolor,
        appBar: AppBar(
          elevation: 0.0,
          title: sText("Add Visiting", whitecolor, 19.0, FontWeight.bold),
          backgroundColor: primaryColor,
        ),
        body: mybody(size));
  }

  mybody(size) {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
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
                  width: MediaQuery.of(context).size.width * .9,
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
                          savevisiting();
                        },
                      );
                    }
                  },
                  color: primarycolor,
                  child: sText("Save", whitecolor, 25.0, FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  savevisiting() async {
    AddCardRequest addCardRequest = AddCardRequest(
      appointmentNo: appointController.text,
      name: nameController.text,
      thana: _selectedThana,
      district: _selectedDistrict,
      cardOcrData: ocrController.text,
      specializations: _selectedSpecializations,
    );

    sendToast('Saving Data. Please Wait');
    MessageIdResponse response =
        await addCardPubulic(addCardRequest: addCardRequest, context: context);

    print(_image.path);
    print(response.message);
    print('ok');
    if (response != null) {
      print(1);
      imageResize.Image image =
          imageResize.decodeImage(_image.readAsBytesSync());

      // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
      print(2);
      imageResize.Image thumbnail =
          imageResize.copyResize(image, width: 500, height: 300);
      print(3);
      print(response.message);
      new Io.File(_image.path)
          .writeAsBytesSync(imageResize.encodePng(thumbnail));
      sendToast('Uploading Image. Please Wait');
      int statusCode =
          await uploadFilePublic(cardId: response.message, image: _image);

      print(statusCode);
      if (statusCode == 200) {
        setState(() {
          _image = null;
          nameController.clear();
          appointController.clear();
          ocrController.clear();
        });
        Navigator.pop(context);
        //_image.delete();
      }
    }
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      height: 47.0,
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 2.0, color: Color(0xffe7e7e7)),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        iconEnabledColor: Colors.black,
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
              style: TextStyle(color: primarycolor, fontSize: 18),
            ),
            value: location2,
          );
        }).toList(),
      ),
    );
  }

  Container districtListDropDown(BuildContext context) {
    return Container(
      height: 47.0,
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 2.0, color: Color(0xffe7e7e7)),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        iconSize: 40,
        hint: Text(
          'Please choose a District',
          style: TextStyle(color: Colors.black54, fontSize: 18.0),
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
              style: TextStyle(color: primarycolor, fontSize: 18),
            ),
            value: location.name,
          );
        }).toList(),
      ),
    );
  }

  final _specializaionItems = specializationList
      .map((item) => MultiSelectItem<String>(item, item))
      .toList();
  List<String> _selectedSpecializations = [];
}
