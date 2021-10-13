import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';

// ignore: must_be_immutable
class PrescriptionCard extends StatelessWidget {
  PrescriptionCard(Datum prescriptionModel) {
    this.prescriptionModel = prescriptionModel;
  }

  Datum prescriptionModel = Datum();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, left: 3.0, right: 3.0),
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: BorderRadius.circular(10.0),
        border:
            Border.all(width: 1.0, color: Color(0xff333333).withOpacity(0.3)),
      ),
      padding:
          EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sText(prescriptionModel.doctorName, primarycolor, 19.0,
              FontWeight.bold),
          Container(
              width: double.infinity,
              child: sText(
                  "Visited On: " + prescriptionModel.createdOn.toString() ??
                      'null',
                  greylightColor,
                  14.0,
                  FontWeight.normal)),
          sText('Date: ' + prescriptionModel.appointmentDate ?? 'null',
              greylightColor, 14.0, FontWeight.bold),
        ],
      ),
    );
  }
}
