import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/Profile/UserModel.dart';
import 'package:need_doctors/models/Profile/profile_model.dart';
import 'package:need_doctors/networking/UserNetworkHolder.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/Profile/utils/editButton.dart';

class HeaderArea extends StatefulWidget {
  HeaderArea(String name) {
    this.name = name;
  }

  String name;

  @override
  _HeaderAreaState createState() => _HeaderAreaState(name);
}

class _HeaderAreaState extends State<HeaderArea> {
  bool circular = true;
  ProfileModel _users;

  _HeaderAreaState(String name) {
    this.name = name;
  }

  String name;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   circular = true;
  //   fetch();
  // }
  // void fetch() async {
  //   _users = await getUsers();
  //   setState(() {
  //     circular = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 8),
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(7.0)),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 8.0),
                      child: Row(
                        children: [
                          sText("Name : ", Colors.black87, 20.0, FontWeight.w300),
                          sText(name, Colors.black87, 20.0, FontWeight.w900),
                        ],
                      ),
                    ),
                    // Padding(
                    //    padding: const EdgeInsets.only(top: 1.0, left: 8.0),
                    //    child: occupation,
                    //  ),
                  ],
                ),
                //edit_button
                // editbutton(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*headerArea(BuildContext context) {

  return Container(
    padding: const EdgeInsets.only(top: 8.0, left: 8),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(7.0)),
    width: double.infinity,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 8.0),
                    child:
                    sText(
                       "Mr. Demo", Colors.black87, 20.0, FontWeight.w500),
                  ),
                 Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 8.0),
                    child: occupation,
                  ),
                ],
              ),
              //edit_button
             // editbutton(context),
            ],
          ),
        )
      ],
    ),
  );
}*/
