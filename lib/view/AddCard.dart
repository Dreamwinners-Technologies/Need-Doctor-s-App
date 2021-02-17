import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

import 'RegiPage.dart';

class AddCardPage extends StatefulWidget {
  AddCardPage({Key key}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController thanaController = TextEditingController();
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

  Future imagefromcamera() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 800);
    setState(() {
      _image = image;
    });
  }

  Future imagefromgallary() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, maxWidth: 800);
    setState(() {
      _image = image;
    });
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
                      top: MediaQuery
                          .of(context)
                          .size
                          .width * .05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1.0, color: Color(0xff008080))),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 4,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: _image != null
                        ? Image.file(
                      _image,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      height: 200,
                      width: 370,
                    ),
                  ),
                ),
                Positioned(
                    top: 50.0,
                    left: 130.0,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Visibility(
                              visible: _image == null ? true : false,
                              child: Image.asset("asset/images/Noimage.jpg"))),
                    ))
              ],
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 50.0,
              margin: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Camera
                  GestureDetector(
                    onTap: () {
                      imagefromcamera();
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
                  //Gallary:
                  GestureDetector(
                    onTap: () {
                      imagefromgallary();
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
                ],
              ),
            ),
            Column(
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

                      if (nameController.text.isEmpty) {
                        sendToast("Name or Thana Cant be empty");
                        throw new Exception("Field Cant be empty");
                      }

                      AddCardRequest addCardRequest = AddCardRequest(
                          appointmentNo: "",
                          name: nameController.text,
                          specialization: selectSpeciality,
                          thana: _selectedThana,
                          district: _selectedDistrict);

                      MessageIdResponse response =
                      await addCard(addCardRequest: addCardRequest);

                      print(_image.path);
                      print(response.message);
                      if (response != null) {
                        print(1);
                        int statusCode = await uploadFile(
                            cardId: response.id, image: _image);

                        print(statusCode);
                        if (statusCode == 201) {
                          setState(() {
                            _image = null;
                            nameController.clear();
                            thanaController.clear();
                          });
                          _image.delete();
                        }
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
          ],
        ),
      ),
    );
  }

  Container ImageContainer() {
    if (_image.exists() != null) {
      return Container(
        margin: const EdgeInsets.only(right: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.9),
          image:
          DecorationImage(image: AssetImage(_image.path), fit: BoxFit.fill),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(right: 3.0),
        child: Text("Hello"),
      );
    }
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

// class DetailScreenImage extends StatelessWidget {
//   DetailScreenImage(File image) {
//     this.image = image;
//   }
//
//   File image;
//   String cardImageUrl;
//
//   @override
//   Widget build(BuildContext context)  {
//     try { // check if imagePath exists. Here is the problem
//       cardImageUrl = check(image.path);
//     } catch (e, s) { // if not
//       imagePath = 'assets/$iconName.png/';
//     }
//
//     return Scaffold(
//       body: GestureDetector(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Hero(
//             tag: 'imageHero',
//             child: Image.asset(
//               cardImageUrl,
//             ),
//           ),
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }
// }

// Widget imagesShow({BuildContext context, String imgUrl}) {
//   return Container(
//       width: MediaQuery.of(context).size.height,
//       height: 170.0,
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(20.0),
//           child: Image.asset(
//             imgUrl,
//             fit: BoxFit.contain,
//           )));
// }

// Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //         builder: (context) =>
//                 //             DetailScreenImage(_image),
//                 //       ),
//                 //     );
//                 //   },
//                 //   // child: imagesShow(
//                 //   //     context: context,
//                 //   //     imgUrl: _image.path),
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FlatButton(
//                       padding: EdgeInsets.all(0.0),
//                       child: NewWidget(
//                           image: _image, icon: Icons.camera_alt_outlined),
//                       // Icon(Icons.camera_alt_outlined,
//                       //     size: 50, color: Color(0xff008080)),
//                       // Icon(Icons.camera_alt,
//                       //   size: 50, color: Color(0xff008080)),
//                       // shape: RoundedRectangleBorder(
//                       //     borderRadius:
//                       //         BorderRadius.all(Radius.circular(24.0))),
//                       onPressed: () async {
//                         print('tap photos');

//                         final pickedFile = await picker.getImage(
//                             source: ImageSource.camera,
//                             maxHeight: 600,
//                             maxWidth: 800);

//                         setState(
//                           () {
//                             if (pickedFile != null) {
//                               _image = File(pickedFile.path);
//                             } else {
//                               print('No image selected.');
//                             }
//                             print(_image.path);
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             )
