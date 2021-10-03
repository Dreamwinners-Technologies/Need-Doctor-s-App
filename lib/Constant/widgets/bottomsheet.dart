import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

customBottomSheet(BuildContext context, String title) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      isDismissible: false,
      backgroundColor: primarylight,
      context: context,
      builder: (_) {
        return Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 4.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sText(title, whitecolor, 24.0, FontWeight.bold),
                Container(
                  height: 24.0,
                  width: 24.0,
                  child: CircularProgressIndicator(
                    backgroundColor: whitecolor,
                  ),
                )
              ],
            ));
      });
}
