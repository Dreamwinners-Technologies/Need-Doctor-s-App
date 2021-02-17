import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // Option 2
  int _selectedDistId;

  List<DistrictLists> testDist =
      districtListsFromJson(jsonEncode(districtListJson));
  List<ThanaLists> listTest = thanaListsFromJson(jsonEncode(thanaListJson));

  List<String> getThana(int id) {
    List<String> thanas = [];
    for (int i = 0; i < listTest.length; i++) {
      if (listTest[i].districtId == id) {
        if (listTest[i].name.isEmpty) {
          continue;
        }
        print(listTest[i].name);
        thanas.add(listTest[i].name);
      }
    }
    print(_selectedLocation);
    print(_selectedDistId);
    print(_selectedLocation2);

    return thanas;
  }

  String _selectedLocation2; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            thanaListDropDown(context),
            districtListDropDown(context),
          ],
        ),
      ),
    );
  }

  Container districtListDropDown(BuildContext context) {
    return Container(
            height: 65.0,
            width: MediaQuery.of(context).size.width * .9,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(width: 2.0, color: primaryColor),
            ),
            child: DropdownButton(
              hint: Text('Please choose a location'),
              // Not necessary for Option 1
              value: _selectedLocation2,
              onChanged: (newValue1) {
                setState(() {
                  _selectedLocation2 = newValue1;
                });
              },
              items: getThana(_selectedDistId).map((location2) {
                return DropdownMenuItem(
                  child: new Text(location2),
                  value: location2,
                );
              }).toList(),
            ),
          );
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
            height: 65.0,
            width: MediaQuery.of(context).size.width * .9,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(width: 2.0, color: primaryColor),
            ),
            child: DropdownButton(
              hint: Text('Please choose a location'),
              // Not necessary for Option 1
              value: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                  _selectedLocation2 = null;

                  for (int i = 0; i < testDist.length; i++) {
                    if (testDist[i].name == newValue) {
                      _selectedDistId = testDist[i].id;
                    }
                  }
                });
              },
              items: testDist.map((location) {
                return DropdownMenuItem(
                  child: new Text(location.name),
                  value: location.name,
                );
              }).toList(),
            ),
          );
  }
}
