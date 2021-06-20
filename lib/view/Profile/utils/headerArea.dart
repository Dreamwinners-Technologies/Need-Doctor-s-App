import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/Profile/utils/editButton.dart';

headerArea(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 35, left: 8),
    color: lightcolor,
    width: double.infinity,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 12.0, bottom: 50.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                    child: drnametext,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 5.0),
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
