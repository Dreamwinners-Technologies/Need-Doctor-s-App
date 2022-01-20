import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';

searchByVisibility(BuildContext context, isChecked, dynamic divisionDropDown, dynamic districtDropDown, dynamic thanaDropDown,
    dynamic specializationContainer) {
  return Visibility(
    visible: isChecked == true ? true : false,
    child: FadeAnimation(
      1,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                divisionDropDown,
                districtDropDown,
                thanaDropDown
                // districtListDropDown(context),
                // SizedBox(
                //   width: 10.0,
                // ),
                // thanaListDropDown(context),
              ],
            ),
          ),
          Container(margin: EdgeInsets.only(left: 7.0, right: 14.0), child: specializationContainer()),
        ],
      ),
    ),
  );
}
