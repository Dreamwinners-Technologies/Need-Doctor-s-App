import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/models/StaticData/AmbulanceModel.dart';
import 'package:need_doctors/models/StaticData/AmbulanceRaw.dart';
import 'package:need_doctors/view/Ambulance/widgets/AmobulanceCard.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

class Ambulance extends StatefulWidget {
  Ambulance();

  @override
  _AmbulanceState createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  _AmbulanceState() {

    List<AmbulanceModel> ambulances = ambulanceListFromJson(jsonEncode(ambulanceList));

    print(ambulances.length);
    this.ambulances = ambulances;
    print(0);
    print(this.ambulances.length);
  }

  List<AmbulanceModel> ambulances = [];

  void searchOption() {
    print("search");
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ambulance List"),
      ),
      body: Center(
        child: Column(
          children: [
            SearchWidget(
              searchController: searchController,
              isWiritten: false,
              callback: searchOption,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: ambulances.length,
                itemBuilder: (BuildContext context, int index) {
                  return AmbulanceCard(ambulances[index]);
                },
              ),
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     AmbulanceCard(),
        //   ],
        // ),
      ),
    );
  }
}
