import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

class AppointmentBottomWidget extends StatelessWidget {
  const AppointmentBottomWidget({Key key, this.tap, this.fee}) : super(key: key);

  final GestureTapCallback tap;
  final String fee;


  @override
  Widget build(BuildContext context) {
    return  Container(
        padding:
            EdgeInsets.only(top: 8.0, bottom: 8.0, left: 14.0, right: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sText("Appointment Fee", whitecolor, 17.0, FontWeight.bold),
                sText("Tk.$fee/-", whitecolor, 20.0, FontWeight.bold)
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    color: whitecolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed:tap,
                    onLongPress: tap,
                    child: sText(
                        "APPOINTMENT", primaryColor, 17.0, FontWeight.bold)),
              ),
            )
          ],
        ),
        height: 120.0,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
      );
  }
}
