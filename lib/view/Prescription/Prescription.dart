import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/models/StaticData/PrescriptionDataRaw.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:need_doctors/view/Prescription/widgets/PrescriptionCard.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInput.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

class Prescription extends StatefulWidget {

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {

  List<PrescriptionModel> prescriptionList = prescriptionFromJson(json.encode(prescriptionDataRaw));

  void searchOption() {
    print("search");
  }

  TextEditingController searchController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text("Prescription"),
      ),
      body: SafeArea(
        child: Center(
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
                  itemCount: prescriptionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PrescriptionCard(prescriptionList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Input for Getting Prescription'),
            // content: const Text('AlertDialog description'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomInput(phoneController, "Phone", "Enter Your Phone", TextInputType.name),
                CustomInput(pinController, "Pin", "Enter Your Pin", TextInputType.number),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'Find'),
                child: const Text('Find'),
              ),
            ],
          ),
        ),
        child: Icon(Icons.filter_alt_sharp),
      ),
    );
  }
}
