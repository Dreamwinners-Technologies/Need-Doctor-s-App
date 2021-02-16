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
  var selectSpeciality, selectThan, selectDis, distId, thanaId;
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
            height: 200,
            width: 370,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             DetailScreenImage(_image),
                //       ),
                //     );
                //   },
                //   // child: imagesShow(
                //   //     context: context,
                //   //     imgUrl: _image.path),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: NewWidget(
                          image: _image, icon: Icons.camera_alt_outlined),
                      // Icon(Icons.camera_alt_outlined,
                      //     size: 50, color: Color(0xff008080)),
                      // Icon(Icons.camera_alt,
                      //   size: 50, color: Color(0xff008080)),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () async {
                        print('tap photos');

                        final pickedFile = await picker.getImage(
                            source: ImageSource.camera,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                     ThanaDropDown(),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () async {
                        shape:
                        // RoundedRectangleBorder(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(24.0)));

                        if (nameController.text.isEmpty ||
                            thanaController.text.isEmpty) {
                          sendToast("Name or Thana Cant be empty");
                          throw new Exception("Field Cant be empty");
                        }

                        AddCardRequest addCardRequest = AddCardRequest(
                            appointmentNo: "",
                            name: nameController.text,
                            specialization: selectSpeciality,
                            thana: thanaController.text,
                            district: selectDis);

                        MessageIdResponse response =
                            await addCard(addCardRequest: addCardRequest);

                        if (response != null) {
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
            ),
          ),
        ],
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
          border: Border.all(width: 2.0, color: primaryColor)),
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

  Container ThanaDropDown() {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          border: Border.all(width: 2.0, color: primaryColor)),
      child: DropdownButton(
        hint: Text("Select Your Thana",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        iconSize: 40,
        dropdownColor: Colors.white,
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            this.selectThan = val;

            Map<String, dynamic> thanaInfo = findFromThana(val);

            this.thanaId = thanaInfo['id'];
            print(thanaId.runtimeType);
          });
        },
        value: this.selectThan,
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

  // ignore: missing_return
  Map<String,dynamic > findFromThana(val) {}
}

class NewWidget extends StatelessWidget {
  NewWidget({File image, IconData icon}) {
    this._image = image;
    this._icon = icon;
  }

  File _image;
  IconData _icon;

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      print("icon");
      return Icon(
        _icon,
        size: 70,
        color: Color(0xff008080),
      );
    } else {
      print("image");
      return Image(
        image: AssetImage(_image.path),
        fit: BoxFit.cover,
        height: 180,
      );
    }
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

class DetailScreen extends StatelessWidget {
  DetailScreen(String cardImageUrl) {
    this.cardImageUrl = cardImageUrl;
  }

  String cardImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              cardImageUrl,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
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
