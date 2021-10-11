import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

import 'package:need_doctors/view/Prescription/Prescription.dart';
import 'package:need_doctors/view/Prescription/othes_prescription.dart';

class PrescriptionTabSetup extends StatelessWidget {
  const PrescriptionTabSetup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primarycolor,
          leading: Container(),
          toolbarHeight: 0.0,
          bottom: TabBar(
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child:
                    sText("My Prescription", whitecolor, 16.0, FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: sText(
                    "Others Prescription", whitecolor, 15.0, FontWeight.bold),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: [MyPrescription(), OthersPrescription()],
        ),
      ),
    );
  }
}
