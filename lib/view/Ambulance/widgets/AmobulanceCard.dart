import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/StaticData/AmbulanceModel.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// ignore: must_be_immutable
class AmbulanceCard extends StatelessWidget {
  AmbulanceCard(AmbulanceModel ambulance) {
    this.ambulance = ambulance;
  }

  AmbulanceModel ambulance = AmbulanceModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(6.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ambulance.name,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "ড্রাইভারঃ " + ambulance.driverName,
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        ambulance.contact,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.call,
                          size: 30,
                          color: primarycolor,
                        ),
                        onPressed: () {
                          askDialog(
                            context,
                            'Call Now',
                            "Do you want call now?",
                            DialogType.WARNING,
                            () {
                              _callNumber(ambulance.contact);

                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  await FlutterPhoneDirectCaller.callNumber(phoneNumber);
}