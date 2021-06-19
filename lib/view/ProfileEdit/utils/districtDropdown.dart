import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/view/Home/utils/banner.dart';

// ignore: non_constant_identifier_names
class DistrictDrop extends StatelessWidget {
  var selectedItem, selectDis, selectThan, selectSpeciality;
  int distId;


  List<DistrictLists> districtList =
  districtListsFromJson(jsonEncode(districtListJson));
  List<ThanaLists> thanaList = thanaListsFromJson(jsonEncode(thanaListJson));

  List<String> getThana(int id) {
    List<String> thanaS = [];
    for (int i = 0; i < thanaList.length; i++) {
      if (thanaList[i].districtId == id) {
        if (thanaList[i].name.isEmpty) {
          continue;
        }
        thanaS.add(thanaList[i].name);
      }
    }
    return thanaS;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: lightcolor,
          border: Border.all(color: primarycolor)),
      child: DropdownButton(
        hint: sText("District",primarycolor, 18, FontWeight.bold),
        iconSize: 40,
        dropdownColor: primaryLight,
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            this.selectDis = val;

            Map<String, dynamic> disInfo = findFromDistrict(val);

            this.distId = disInfo['id'];
            print(distId.runtimeType);
          });
        },
        value: this.selectDis,
        items: districtListJson.map((val) {
          return DropdownMenuItem(
            value: val['name'],
            child: Text(
              val['name'],
              style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
        }).toList(),
        ),
      );
  }
}



Object findFromDistrict(String value) {
  var data = districtListJson.where((row) => (row["name"].contains(value)));
  if (data.length >= 1) {
    return data.single;
  } else {
    return null;
  }
}
