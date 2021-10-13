import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/models/Profile/ProfileResponse.dart';
import 'package:need_doctors/networking/UserNetworkHolder.dart';
import 'package:need_doctors/view/Profile/utils/headerArea.dart';
import 'package:need_doctors/view/Profile/utils/textInfo.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/networking/UserNetworkHolder.dart';
import 'package:need_doctors/models/Profile/UserModel.dart';
class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool circular = true;
  UserNetworkHolder _users;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    circular = true;
    fatch();
}
void fatch() async {
  _users = await getUsers();
  setState(() {
    circular = false;
  });
}
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0.0, title: myprofiletex),
        body: circular?Center(child: CircularProgressIndicator()): Container(
            child:
                profileView()) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
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
                padding: EdgeInsets.only(
                    top: 8.0, left: 10.0, right: 10.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerArea(context),
                    infotext(
                      _users.name,
                    _users.phoneNo,
                    _users.specialization,
                    _users.organization,
                    _users.bmdcRegistrationNo,
                    _users.thana,
                    _users.designation,
                    _users.qualification,

                    ),]
                )),
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
