import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/Profile/profile_model.dart';
import 'package:need_doctors/networking/UserNetworkHolder.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/Profile/utils/headerArea.dart';
import 'package:need_doctors/view/Profile/utils/textInfo.dart';
import 'package:need_doctors/view/ProfileEdit/ProfileEdit.dart';
import 'package:need_doctors/view/login/LoginPage.dart';

final storage = FlutterSecureStorage();

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool circular = true;
  ProfileModel _users;
  String userType;

  @override
  void initState() {
    super.initState();
    circular = true;
    getuserType();
    fetch();
  }

  void getuserType() async {
    userType = await storage.read(key: 'userType');
    print(userType);
  }

  void fetch() async {
    _users = await getUsers();
    setState(() {
      circular = false;
    });
  }

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: myprofiletext,
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: white,
              ),
              onPressed: () {
                askDialog(
                  context,
                  "Logout",
                  'Do You Want to Logout?',
                  DialogType.WARNING,
                  () async {
                    await storage.deleteAll();
                    storage.write(key: "isNewApp", value: "false");

                    // Navigator.pop(context);
                    //Navigator.popUntil(context, (route) => route.isFirst);
                    //Navigator.push(context, route)
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                          return LoginScreen();
                        }, transitionsBuilder: (BuildContext context, Animation<double> animation,
                                Animation<double> secondaryAnimation, Widget child) {
                          return new SlideTransition(
                            position: new Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        }),
                        (Route route) => false);
                  },
                );
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button Kaj Korse");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProfileEdit(
                          profileModel: _users,
                          userType: userType,
                        ))).whenComplete(() => fetch());
          },
          child: const Icon(Icons.edit),
          backgroundColor: Colors.green,
        ),
        body: circular
            ? Center(child: CircularProgressIndicator())
            : Container(child: profileView(userType)) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView(type) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 80.0,
          color: primarycolor,
        ),

        Padding(
          padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0, bottom: 8.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderArea(_users.name),
                  infotext(
                      _users.phoneNo,
                      _users.specialization,
                      _users.organization,
                      _users.thana,
                      _users.bmdcRegistrationNo,
                      _users.designation,
                      _users.qualification,
                      _users.district,
                      _users.pinNo,
                      _users.email,
                      type),
                ],
              ),
            ),
          ),
        )
        //headerArea(context),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10.0, top: 8),
        //   child: sText("Info", primarycolor, 15, FontWeight.bold),
        // ),
        //details
        // infotext('018********', 'email@gmail.com', 'Speciality',
        //     'Organaization', 'Address')
      ],
    );
  }
}
