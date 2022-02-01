import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:need_doctors/service/visiting_card_list.dart';

aboutDoctor(BuildContext context, CardInfoResponseList cardInfoResponseList) {
  return Container(
    margin: EdgeInsets.only(top: 6.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          color: Colors.grey.withOpacity(0.1),
          width: double.infinity,
          child: sText("About Doctor", blackcolor.withOpacity(0.7), 19.0,
              FontWeight.bold),
        ),
        textset(context, cardInfoResponseList.name, Icons.person_pin),
        GestureDetector(
            onTap: () {
              askDialog(context, 'Call Now', "Do you want call now?",
                  DialogType.WARNING, () {
                _callNumber(cardInfoResponseList.appointmentNo);

                Navigator.pop(context);
              });
            },
            child: phonetextset(
                context, cardInfoResponseList.appointmentNo, Icons.phone)),
        textset(context, getSpeList(cardInfoResponseList.specialization),
            Icons.work_outline),
        textset(
            context, cardInfoResponseList.district, Icons.location_on_rounded),
        textset(
            context, cardInfoResponseList.thana, Icons.location_on_outlined),
      ],
    ),
  );
}

String getSpeList(var temp) {
  String specializations = "";
  var tempData = temp;
  for (int i = 0; i < tempData.length; i++) {
    specializations += tempData[i];
  }
  return specializations;
}

Widget textset(BuildContext context, String title, IconData iconData) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, bottom: 5, left: 8.0, right: 2.0),
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(bottom: 6.0, top: 6.0),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(right: 3.0),
            // height: 25.0,
            // width: 20.0,
            // child: SvgPicture.asset(svg),
            child: Icon(
              iconData,
              color: primarycolor,
            )),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          padding: const EdgeInsets.only(top: 2.0),
          child:
              mText(title, blackcolor.withOpacity(0.7), 17.0, FontWeight.w500),
        )
      ],
    ),
  );
}

Widget phonetextset(BuildContext context, String title, IconData iconData) {
  return Container(
    alignment: Alignment.centerLeft,
    height: 37.0,
    margin: const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
    padding: EdgeInsets.only(
      bottom: 6.0,
    ),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 3.0),
                child: Icon(
                  iconData,
                  color: primarycolor,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: mText(
                  title, blackcolor.withOpacity(0.7), 17.0, FontWeight.w500),
            ),
          ],
        ),
        Material(
          child: InkWell(
            child: Container(
                width: 58.0,
                decoration: BoxDecoration(
                    color: secondarycolor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                    child: sText("Call", whitecolor, 17.0, FontWeight.bold))),
          ),
        ),
      ],
    ),
  );
}

//direct Call
_callNumber(String phoneNumber) async {
  await FlutterPhoneDirectCaller.callNumber(phoneNumber);
}
