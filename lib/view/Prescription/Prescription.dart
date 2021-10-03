import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/StaticData/PrescriptionDataRaw.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:need_doctors/view/Prescription/widgets/PrescriptionCard.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInput.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';
import 'package:photo_view/photo_view.dart';

class Prescription extends StatefulWidget {
  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  List<PrescriptionModel> prescriptionList =
      prescriptionFromJson(json.encode(prescriptionDataRaw));

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
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            sText("Others", whitecolor, 14.0, FontWeight.bold),
          ],
        ),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Others Prescription'),
            // content: const Text('AlertDialog description'),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInput(phoneController, "Phone", "Enter Your Phone",
                        TextInputType.number),
                    CustomInput(pinController, "Pin", "Enter Your Pin",
                        TextInputType.number),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (phoneController.text.isEmpty ||
                      pinController.text.isEmpty) {
                    customDialog(context, "Empty", "Field Connot be Empty",
                        DialogType.ERROR);
                  } else {
                    if (phoneController.text == '018' &&
                        pinController.text == "111") {
                      Navigator.pop(context);
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                              child: PhotoView(
                                  imageProvider:
                                      AssetImage('asset/logog.png'))));

                      setState(() {
                        phoneController.text = "";
                        pinController.text = "";
                      });
                    } else {
                      customDialog(context, "Not Found", "Sorry Not Available",
                          DialogType.ERROR);
                    }
                  }
                },
                child: const Text('Find'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
