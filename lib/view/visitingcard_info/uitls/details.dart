import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

doctorDetails(BuildContext context,String cardOcrData) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: const EdgeInsets.only(top: 1.0),
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          color: Colors.grey.withOpacity(0.1),
          width: double.infinity,
          child: sText(
              "Details", blackcolor.withOpacity(0.7), 19.0, FontWeight.bold),
        ),
        Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 14.0, right: 14.0, bottom: 8.0),
            child: mText(cardOcrData,
                blackcolor.withOpacity(0.7), 15.0, FontWeight.w500)),
      ],
    ),
  );
}
