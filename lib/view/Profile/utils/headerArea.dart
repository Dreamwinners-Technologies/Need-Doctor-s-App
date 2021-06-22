import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/Profile/utils/editButton.dart';

headerArea(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 8.0, left: 8),
    decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: primarycolor,
        ),
        borderRadius: BorderRadius.circular(4.0)),
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
                    child: sText(
                        "Mr. Demo", Colors.black87, 20.0, FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 8.0),
                    child: occupation,
                  ),
                ],
              ),
              //edit_button
              editbutton(context),
            ],
          ),
        )
      ],
    ),
  );
}
