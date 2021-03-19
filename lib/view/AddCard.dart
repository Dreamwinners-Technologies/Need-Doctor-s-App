import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';
import 'package:image/image.dart' as imageResize;

class AddCardPage extends StatefulWidget {
  AddCardPage({Key key}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
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
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1.0, color: Color(0xff008080))),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: _image != null
                        ? Image.file(
                            _image,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * .9,
                          ),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width * .9,
                  margin: EdgeInsetsDirectional.only(
                      top: (MediaQuery.of(context).size.height / 6) / 2.5),
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Visibility(
                          visible: _image == null ? true : false,
                          child: Image.asset("asset/images/Noimage.jpg"))),
                ),
                // )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              margin: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Camera
                  Material(
                    child: InkWell(
                      onTap: () {
                        imagepick(ImageSource.camera);
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        margin: const EdgeInsets.only(right: 25.0),
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                          Icons.add_a_photo,
                          color: white,
                          size: 26,
                        )),
                      ),
                    ),
                  ),
                  //Gallary:
                  Material(
                    child: InkWell(
                      onTap: () async {
                        imagepick(ImageSource.gallery);
                      },
                      child: Container(
                        height: 50.0, width: 50.0,
                        // padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                          Icons.photo_library,
                          color: white,
                          size: 25,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset(0.1, 0.2),
                  child: Text(
                    'Check Info',
                    style: TextStyle(
                      color: Color(0xff008080),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
              child: FadeAnimation(
                1,
                _buildTextField1(nameController, 'Dr. Name', context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
              child: FadeAnimation(
                1,
                _buildTextField1(appointController, 'Appointment No', context),
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
                _buildTextField2(ocrController, 'Scanned Text', context),
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
                  shape:
                  // RoundedRectangleBorder(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(24.0)));

                  if (_image == null) {
                    sendToast("Please Select Image First");
                    throw new Exception("Please Select Image First");
                  }

                  if (nameController.text.isEmpty) {
                    sendToast("Name can't be empty");
                    throw new Exception("Field Cant be empty");
                  }

                  if (appointController.text.isEmpty) {
                    sendToast("Appointment No can't be empty");
                    throw new Exception("Appointment Cant be empty");
                  }

                  if (_selectedThana == null ||
                      _selectedSpecializations.isEmpty ||
                      _selectedDistrict == null) {
                    sendToast("Fields can't be empty");
                    throw new Exception("Fields can't be empty");
                  }

                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    tittle: 'Is Every information Correct?',
                    desc: 'You wants to add those info?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
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
                          await addCard(addCardRequest: addCardRequest, context: context);

                      print(_image.path);
                      print(response.message);
                      if (response != null) {
                        print(1);
                        imageResize.Image image =
                            imageResize.decodeImage(_image.readAsBytesSync());

                        // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
                        print(2);
                        imageResize.Image thumbnail = imageResize
                            .copyResize(image, width: 500, height: 300);
                        print(3);
                        new Io.File(_image.path)
                            .writeAsBytesSync(imageResize.encodePng(thumbnail));
                        sendToast('Uploading Image. Please Wait');
                        int statusCode = await uploadFile(
                            cardId: response.id, image: _image);

                        print(statusCode);
                        if (statusCode == 201) {
                          setState(() {
                            _image = null;
                            nameController.clear();
                            appointController.clear();
                            ocrController.clear();
                          });
                          _image.delete();
                        }
                      }
                    },
                  )..show();

                  // AddCardRequest addCardRequest = AddCardRequest(
                  //     appointmentNo: appointController.text,
                  //     name: nameController.text,
                  //     thana: _selectedThana,
                  //     district: _selectedDistrict,
                  //     cardOcrData: ocrController.text,
                  //     specializations: _selectedSpecializations,
                  // );
                  //
                  // sendToast('Saving Data. Please Wait');
                  // MessageIdResponse response =
                  // await addCard(addCardRequest: addCardRequest);
                  //
                  // print(_image.path);
                  // print(response.message);
                  // if (response != null) {
                  //   print(1);
                  //   imageResize.Image image =
                  //   imageResize.decodeImage(_image.readAsBytesSync());
                  //
                  //   // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
                  //   imageResize.Image thumbnail =
                  //   imageResize.copyResize(image, width: 1000, height: 600);
                  //
                  //   new Io.File(_image.path)
                  //       .writeAsBytesSync(imageResize.encodePng(thumbnail));
                  //   sendToast('Uploading Image. Please Wait');
                  //   int statusCode =
                  //   await uploadFile(cardId: response.id, image: _image);
                  //
                  //   print(statusCode);
                  //   if (statusCode == 201) {
                  //     setState(() {
                  //       _image = null;
                  //       nameController.clear();
                  //       appointController.clear();
                  //       ocrController.clear();
                  //     });
                  //     _image.delete();
                  //   }
                  // }
                },
                color: Color(0xff008080),
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
    );
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
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // color: Color(0xff00BAA0),
          // color: Colors.white,
          border: Border.all(width: 2.0, color: Color(0xff008080))),
      child: MultiSelectDialogField(
        // items: _items,
        items: _specializaionItems,
        title: Text("Select Your Speciality",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        selectedColor: primaryColor,
        buttonText: Text("Select Your Speciality",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        onConfirm: (results) {
          _selectedSpecializations = results.cast();
        },
      ),
    );
  }
}

_buildTextField1(
    TextEditingController controller, String labelText, BuildContext context) {
  return Container(
    height: 50.0,
    width: MediaQuery.of(context).size.width * .9,
    padding: EdgeInsets.symmetric(horizontal: 5),
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

_buildTextField2(
    TextEditingController controller, String labelText, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * .9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2.0, color: Color(0xff008080))),
    child: TextFormField(
      maxLines: 5,
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
