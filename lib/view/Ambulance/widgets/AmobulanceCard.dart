import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:need_doctors/service/amblance_list_model.dart';
import 'package:need_doctors/view/Ambulance/AmbulanceList/AmbulanceDetails.dart';

// ignore: must_be_immutable
class AmbulanceCard extends StatelessWidget {
  AmbulanceCard(ListOfAmbulance ambulance) {
    this.ambulance = ambulance;
  }

  ListOfAmbulance ambulance = ListOfAmbulance();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: GestureDetector(
              onTap: () {
                print("Tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AmbulanceDetails(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Tab(
                        icon: Image.asset("asset/ambulanceicon.png"),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ambulance.address,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "ড্রাইভারঃ " + ambulance.upazila,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          Text(
                            ambulance.district,
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
                                  _callNumber(ambulance.phoneNo);

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
        ),
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  await FlutterPhoneDirectCaller.callNumber(phoneNumber);
}
