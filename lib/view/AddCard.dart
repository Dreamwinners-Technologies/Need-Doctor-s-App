import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/item/objectdata.dart';
import 'package:need_doctors/models/Card/AddCardRequest.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictList.dart';
import 'package:need_doctors/networking/CardNetwork.dart';

import 'RegiPage.dart';

// class AddCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

class AddCardPage extends StatefulWidget {
  AddCardPage({Key key}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController thanaController = TextEditingController();
  var selectSpeciality, selectDis, distId;
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 1.0, color: Color(0xff008080))),
              height: 140,
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        child: Icon(Icons.camera_alt_outlined,
                            size: 50, color: Color(0xff008080)),
                        // Icon(Icons.camera_alt,
                        //   size: 50, color: Color(0xff008080)),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(24.0))),
                        onPressed: () async {
                          print('tap photos');

                          final pickedFile =
                          await picker.getImage(source: ImageSource.camera,
                              maxHeight: 600,
                              maxWidth: 800);

                          setState(
                                () {
                              if (pickedFile != null) {
                                _image = File(pickedFile.path);
                              } else {
                                print('No image selected.');
                              }
                              print(_image.path);
                            },
                          );
                        },
                        color: Colors.white,
                        elevation: 0,
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
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
                      _buildTextField1(
                        nameController,
                        'Dr. Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      // _buildTextField1(
                      //   nameController,
                      //   'Specialization',
                      // ),
                      specializationContainer(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      DistrctDropDown(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        thanaController,
                        'Thana',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1,
                    MaterialButton(
                      minWidth: 100,
                      height: 35,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () async {
                        print("tap");
                        print(nameController.text);
                        print(selectSpeciality);
                        print(selectDis);
                        print(thanaController.text);



                        AddCardRequest addCardRequest = AddCardRequest(appointmentNo: "", name: nameController.text,
                        specialization: selectSpeciality, thana: thanaController.text, district: selectDis);

                        MessageIdResponse response = await addCard(addCardRequest: addCardRequest);

                        if(response!=null){
                          await uploadFile(cardId: response.id, image: _image);
                        }

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
          ),
        ],
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
        items: specalizationlist.map(
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

  Container DistrctDropDown() {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          border: Border.all(width: 2.0, color: Color(0xff00BAA0))),
      child: DropdownButton(
        hint: Text("Select Your District",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        iconSize: 40,
        dropdownColor: Colors.white,
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
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          );
        }).toList(),
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
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
          border: InputBorder.none),
    ),
  );
}
