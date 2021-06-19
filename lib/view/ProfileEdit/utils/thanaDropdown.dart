import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/view/Home/utils/banner.dart';

// ignore: must_be_immutable
class thanaDrops extends StatelessWidget {
  var selectedItem, selectDis, selectThan, selectSpeciality;
  int distId;

  String _selectedDistrict; // Option 2
  int _selectedDistrictId;

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
  String _selectedThana;
  @override
  Widget build(BuildContext context) {
      return Container(
        height: 55.0,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: lightcolor,
            border: Border.all(color: primarycolor)),
        child: DropdownButton(
          isExpanded: true,
          iconSize: 40,
          dropdownColor: lightcolor,
          hint: sText(
              'Thana', primarycolor, 18, FontWeight.bold
              ),
          // Not necessary for Option 1
          value: _selectedThana,
          onChanged: (newValue1) {
            setState(() {
              _selectedThana = newValue1;
            });
          },
          items: getThana(_selectedDistrictId).map((location2) {
            return DropdownMenuItem(
              child: Text(
                location2,
                style: TextStyle(color: primarycolor, fontSize: 20),
                ),
              value: location2,
              );
          }).toList(),
          ),
        );
    }
  }

