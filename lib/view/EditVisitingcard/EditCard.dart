import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as imageResize;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/AddVisitingCard/utils/image_gallaryBtn.dart';
import 'package:need_doctors/view/AddVisitingCard/utils/imagebox.dart';
import 'package:need_doctors/view/AddVisitingCard/utils/textFieled.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';

// ignore: must_be_immutable
class EditCardPage extends StatefulWidget {
  EditCardPage(CardInfoResponseList itemList, {Key key}) {
    this.itemList = itemList;
  }

  CardInfoResponseList itemList;

  @override
  _EditCardPageState createState() => _EditCardPageState(itemList);
}

class _EditCardPageState extends State<EditCardPage> {
  _EditCardPageState(CardInfoResponseList itemList) {
    this.itemList = itemList;

    setData(itemList);
  }

  CardInfoResponseList itemList;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ocrController = TextEditingController();
  final TextEditingController appointController = TextEditingController();
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
        // maxHeight: 600,
        // maxWidth: 1000,
        // maxHeight: 1800,
        // maxWidth: 3000,
        aspectRatio: CropAspectRatio(ratioX: 10, ratioY: 6));
    if (cropped != null) {
      setState(() {
        _image = cropped;
      });
    }
    print('Reading Text');
    sendToast('Reading Info From Card. Please Wait...');
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

      sendToast('Data Reading Complete.');
    } catch (e) {
      sendToast(e.toString());
      print(e);
    }
  }

  String _imagePath;
  List<String> inValue = [];

  void setData(CardInfoResponseList itemList) async {
    nameController.text = itemList.name;
    appointController.text = itemList.appointmentNo;
    ocrController.text = itemList.cardOcrData;
    _selectedDistrict = itemList.district;

    for (int i = 0; i < districtList.length; i++) {
      if (districtList[i].name == itemList.district) {
        _selectedDistrictId = districtList[i].id;
        break;
      }
    }
    _selectedThana = itemList.thana;

    // ignore: unused_local_variable
    int temp = 0;

    _selectedSpecializations = itemList.specialization;

    // String sp = itemList.specialization;
    // List spSaved = specializationList;
    // for (int i = 0; i < sp.length; i++) {
    //   if (sp[i] == '\n' || i == sp.length - 1) {
    //     String t1 = sp.substring(temp, i + 1);
    //     String t2 = sp.substring(temp, i);
    //     if (spSaved.contains(t1)) {
    //       print("yes 1");
    //       inValue.add(t1);
    //
    //       _selectedSpecializations.add(t1);
    //     }
    //     if (spSaved.contains(t2)) {
    //       print("yes 2");
    //       inValue.add(t2);
    //
    //       _selectedSpecializations.add(t2);
    //     }
    //     print(t1);
    //
    //     temp = i + 1;
    //     // inValue.add(t1);
    //     //
    //     // _selectedSpecializations.add(t1);
    //   }
    // }

    // ignore: unused_local_variable
    var rng = new Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    _image = new File('$tempPath' +
        (DateTime.now().millisecondsSinceEpoch).toString() +
        'n.jpg');
    var response = await http.get(itemList.cardImageUrl);

    await _image.writeAsBytes(response.bodyBytes);
    _imagePath = _image.path;

    setState(() {});
    print(_image.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(_selectedSpecializations[0]+" 0");
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        if (_image != null) {
          if (await _image.exists()) {
            await _image.delete();
          }
        }
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: primarycolor,
        appBar: AppBar(
          elevation: 0.0,
          title: sText("Edit Card", whitecolor, 19.0, FontWeight.bold),
          backgroundColor: primaryColor,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
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
                      child: sText("Card Information", primarycolor, 19.0,
                          FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    buildTextField1(
                        appointController, 'Appointment No', context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    buildTextField1(nameController, 'Dr. Name', context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    // specializationContainer(),
                    specializationContainer1(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    // DistrctDropDown(),
                    districtListDropDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    // ThanaDropDown(),
                    thanaListDropDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    buildTextField1(ocrController, 'Scanned Text', context),
                  ),
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
                      print(_selectedDistrict);
                      print(_selectedThana);
                      print(_selectedSpecializations);
                      if (_image == null) {
                        sendToast("Please Select Image First");
                        throw new Exception("Please Select Image First");
                      }
                      if (appointController.text.isEmpty) {
                        sendToast("Appointment No can't be empty");
                        throw new Exception("Appointment Cant be empty");
                      }

                      if (nameController.text.isEmpty) {
                        sendToast("Name can't be empty");
                        throw new Exception("Name Cant be empty");
                      }
                      if (_selectedDistrict == null) {
                        sendToast("District can't be empty");
                        throw new Exception("District can't be empty");
                      }
                      if (_selectedThana == null) {
                        sendToast("Thana can't be empty");
                        throw new Exception("Thana can't be empty");
                      }
                      if (_selectedSpecializations.isEmpty) {
                        sendToast("Specialization can't be empty");
                      } else {
                        askDialog(
                          context,
                          "Alert",
                          'Do you wants to add those info?',
                          DialogType.WARNING,
                          () {
                            print(appointController.text);

                            editvisiting();
                          },
                        );
                      }
                    },
                    color: Color(0xff9f68ff),
                    child: Text('Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  editvisiting() async {
    AddCardRequest addCardRequest = AddCardRequest(
        appointmentNo: appointController.text,
        name: nameController.text,
        thana: _selectedThana,
        district: _selectedDistrict,
        cardOcrData: ocrController.text,
        specializations: _selectedSpecializations);

    sendToast('Saving Data. Please Wait');
    MessageIdResponse response =
        await editCard(addCardRequest: addCardRequest, cardId: itemList.id);

    print(_image.path);
    print(response.message);
    if (response != null) {
      print(1);
      imageResize.Image image =
          imageResize.decodeImage(_image.readAsBytesSync());

      // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
      imageResize.Image thumbnail =
          imageResize.copyResize(image, width: 1000, height: 600);

      new Io.File(_image.path)
          .writeAsBytesSync(imageResize.encodePng(thumbnail));
      print(_imagePath);
      print(_image.path);
      if (_imagePath != _image.path) {
        sendToast('Uploading Image. Please Wait');
        int statusCode = await uploadFile(cardId: response.id, image: _image);

        print(statusCode);
      }

      _image.delete();
      setState(() {
        _image = null;
        nameController.clear();
        ocrController.clear();
      });
      Navigator.pop(context);
    }
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.symmetric(horizontal: 10),
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
      height: 50.0,
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.symmetric(horizontal: 10),
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

  final _specializaionItems = specializationList
      .map((item) => MultiSelectItem<String>(item, item))
      .toList();

  List<String> _selectedSpecializations = [];

  Container specializationContainer1() {
    return Container(
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
        initialValue: inValue,
        title: sText(
            "Select Your Speciality", Colors.black54, 17.0, FontWeight.w700),
        selectedColor: primarycolor,
        buttonText: sText(
            "Select Your Speciality", Colors.black54, 17.0, FontWeight.w700),
        onConfirm: (results) {
          _selectedSpecializations = results.cast();
        },
      ),
    );
  }
}
