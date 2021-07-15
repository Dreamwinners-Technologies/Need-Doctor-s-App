import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/view/drug_details/utils/header.dart';
import 'package:need_doctors/view/drug_details/utils/itemList.dart';

// ignore: must_be_immutable
class DragDetails extends StatefulWidget {
  DragDetails(DrugDetails drugModelList, String medicineType) {
    this.drugModelList = drugModelList;
    medicineTypeIcon = medicineType;
  }

  DrugDetails drugModelList;
  String medicineTypeIcon;

  @override
  _DragDetailsState createState() =>
      _DragDetailsState(drugModelList, medicineTypeIcon);
}

class _DragDetailsState extends State<DragDetails> {
  _DragDetailsState(DrugDetails drugModelList, String medicineTypeIcon) {
    this.drugModelList = drugModelList;
    this.medicineTypeIcon = medicineTypeIcon;
  }

  DrugDetails drugModelList;
  String medicineTypeIcon;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _weight = MediaQuery.of(context).size.width;
    String name = drugModelList.brandName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: sText("Details of $name", whitecolor, 17.0, FontWeight.bold),
      ),
      body: myBody(_height, _weight),
    );
  }

  //fullbody:
  myBody(_height, _weight) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      height: _height,
      width: _weight,
      child: ListView(
        physics: ScrollPhysics(),
        children: [
          //header:
          drugInfoHeader(context, drugModelList, medicineTypeIcon, _weight),
          //List:
          itemsDrugDetials(drugModelList)
        ],
      ),
    );
  }
}
