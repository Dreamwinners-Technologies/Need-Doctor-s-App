import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/about_doctor.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/details.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/image.dart';

// ignore: must_be_immutable
class VisitingCardInformation extends StatefulWidget {
  VisitingCardInformation({CardInfoResponseList cardInfoResponseList}) {
    this.cardInfoResponseList = cardInfoResponseList;
  }

  CardInfoResponseList cardInfoResponseList;

  @override
  _VisitingCardInformationState createState() =>
      _VisitingCardInformationState(cardInfoResponseList);
}

class _VisitingCardInformationState extends State<VisitingCardInformation> {
  _VisitingCardInformationState(CardInfoResponseList cardInfoResponseList) {
    this.cardInfoResponseList = cardInfoResponseList;

    if (this.cardInfoResponseList.cardImageUrl.contains("https")) {
      print(1);
    } else {
      print(2);
      this.cardInfoResponseList.cardImageUrl =
          this.cardInfoResponseList.cardImageUrl.replaceAll("http", "https");
    }

    if (this.cardInfoResponseList.cardOcrData == null) {
      this.cardInfoResponseList.cardOcrData = "No Data";
    }
  }

  CardInfoResponseList cardInfoResponseList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: widget.cardInfoResponseList.id,
      child: Scaffold(
          backgroundColor: primarycolor,
          appBar: AppBar(
            elevation: 0.0,
            title: sText(
                cardInfoResponseList.name, whitecolor, 19.0, FontWeight.bold),
          ),
          body: myBody(context, size)),
    );
  }

  //Body
  myBody(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.only(top: 6.0),
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
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
    );
  }
}
