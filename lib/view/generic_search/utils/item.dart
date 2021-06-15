import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/view/SearchMedicineNew.dart';


genericitem(String name, BuildContext context) {
  if (name == null) {
    return;
  }

  return GestureDetector(
    onTap: () async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchMedicineNew(
                    false,
                    generic: name,
                  )));
    },
    child: Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.7,
        color: Color(0xffe7e7e7),
      ))),
      height: 40.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: sText(name, primarycolor, 16.0, FontWeight.w500),
    ),
  );
}
