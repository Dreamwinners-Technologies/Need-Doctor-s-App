// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/view/Appointment/utils/payment_select.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/about_doctor.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/details.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/image.dart';

// ignore: must_be_immutable
class AmbulanceInfo extends StatefulWidget {
  AmbulanceInfo({CardInfoResponse cardInfoResponseList}) {
    this.cardInfoResponseList = cardInfoResponseList;
  }

  CardInfoResponse cardInfoResponseList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

// @override
//_AmbulanceInfoState createState() =>
//  _AmbulanceInfoState(cardInfoResponseList);
}

class _AmbulanceInfoState extends State<AmbulanceInfo> {
  CardInfoResponse cardInfoResponseList;

  @override
  Widget build(BuildContext context) {
    stateController.doctorName.value = cardInfoResponseList.name;
    stateController.doctorinfo.value = cardInfoResponseList;
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: widget.cardInfoResponseList.id,
      child: Scaffold(
          backgroundColor: primarycolor,
          appBar: AppBar(
            elevation: 0.0,
            title: sText(cardInfoResponseList.name, whitecolor, 16.0, FontWeight.bold),
          ),
          body: myBody(context, size)),
    );
  }

  //Body
  myBody(BuildContext context, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      child: Container(
        decoration: BoxDecoration(
          color: whitecolor,
        ),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Card Image
              cardImage(context, cardInfoResponseList.cardImageUrl),

              //about doctor
              aboutDoctor(context, cardInfoResponseList),

              //Detials

              doctorDetails(context, cardInfoResponseList.cardOcrData)
            ],
          ),
        ),
      ),
    );
  }
}
