import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/view/ProfileEdit.dart';

// <<<<<<< HEAD
// class MyProfile extends StatelessWidget {
// =======
// class EditProfile extends StatelessWidget {
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            profileView() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
// <<<<<<< HEAD
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Color(0xff008080), Color(0xff008080)])),
// =======
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               // color: [
//               //   Color(0xff008080),
//               //   Color(0xff008080),
//               // ],
//             ),
//           ),
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(1, 30, 10, 30),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: 45,
                        width: 45,
                        child: Icon(Icons.arrow_back_ios,
                            size: 24, color: Colors.white),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      onTap: () {
                        print('back');
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'My Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.edit_road_outlined,
                            size: 24, color: Colors.white),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      onTap: () {
// <<<<<<< HEAD
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileEdit()));

                        print('Edit Page');
// =======
//                         print('Edit');
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
// <<<<<<< HEAD
//                   FadeAnimation(
//                     1,
//                     Container(
//                       height: 59,
//                       width: 59,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(
//                             image: AssetImage("asset/Avatar1.png")),
//                       ),
// =======
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("asset/Avatar1.png")),
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
                    ),
                  ),
                  Column(
                    children: [
                      FadeAnimation(
                        1,
                        Text(
                          'Dr. Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1,
                        Text(
                          '018********',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
// <<<<<<< HEAD
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                   child: FadeAnimation(
//                     1,
//                     _buildText(
//                       nameController,
//                       'doctor@gmail.com',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                   child: FadeAnimation(
//                     1,
//                     _buildText(
//                       nameController,
//                       '274****',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                   child: FadeAnimation(
//                     1,
//                     _buildText(
//                       nameController,
//                       'Specalization',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                   child: FadeAnimation(
//                     1,
//                     _buildText(
//                       nameController,
//                       'Organization',
//                     ),
// =======
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: FadeAnimation(
                    1,
                    _buildText(
                      nameController,
                      'doctor@gmail.com',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: FadeAnimation(
                    1,
                    _buildText(
                      nameController,
                      '274****',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: FadeAnimation(
                    1,
                    _buildText(
                      nameController,
                      'Specalization',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: FadeAnimation(
                    1,
                    _buildText(
                      nameController,
                      'Organization',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: FadeAnimation(
                    1,
                    _buildText(
                      nameController,
                      'Address',
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: FadeAnimation(
                    1,
                    _buildText(
                      nameController,
                      'Address',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

_buildText(TextEditingController controller, String labelText) {
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Color(0xff008080),
          width: 1,
        ),
      ),
    ),
    child: Row(
      children: <Widget>[
        Text(
          labelText,
          style: TextStyle(color: Color(0xff008080), fontSize: 18),
        ),
      ],
    ),
  );
}
