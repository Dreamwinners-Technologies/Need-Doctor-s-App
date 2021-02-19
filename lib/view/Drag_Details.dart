import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/org_data/text_style.dart';

class DragDetails extends StatefulWidget {
  DragDetails(DrugModelList drugModelList) {
    this.drugModelList = drugModelList;
  }
  DrugModelList drugModelList;

  @override
  _DragDetailsState createState() => _DragDetailsState(drugModelList);
}

class _DragDetailsState extends State<DragDetails> {
  _DragDetailsState(DrugModelList drugModelList) {
    this.drugModelList = drugModelList;
  }
  DrugModelList drugModelList;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double _height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double _weight = MediaQuery.of(context).size.width;
    return Scaffold(
      
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primaryColor,
          title: Text(drugModelList.name)),
         body: Container(
           padding: const EdgeInsets.only(bottom: 5.0),
        height: _height,
        width: _weight,
        child: ListView(
         physics: ScrollPhysics(),
          children: [
            headerdate(_weight),
            Column(
              children: [
                druginfolist(drugModelList.name, 'Name inof'),
                druginfolist(drugModelList.adultDose, 'Name inof'),
                druginfolist(drugModelList.childDose, 'Name inof'),
                druginfolist(drugModelList.renalDose, 'Name inof'),
                druginfolist(drugModelList.administration, 'Name inof'),
                druginfolist(
                    drugModelList.contraindications, 'Name inof'),
                druginfolist(drugModelList.sideEffects, 'Name inof'),
                druginfolist(
                    drugModelList.precautionsAndWarnings, 'Name inof'),
                druginfolist(
                    drugModelList.pregnancyAndLactation, 'Name inof'),
                druginfolist(drugModelList.therapeuticClass, 'Name inof'),
                druginfolist(drugModelList.modeOfAction, 'Name inof'),
                druginfolist(drugModelList.interaction, 'Name info'),
                druginfolist(drugModelList.packSizeAndPrice, 'Name ifno'),
              ],
            )
          ],
        ),
      ),
    );
  }

  headerdate(double _weight) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 12.0, bottom: 12.0),
          color: primaryColor,
          width: _weight,
          height: 130.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(drugModelList.type, style: drugtypestyle),
              Padding(
                padding: padding14,
                child: Text(
                  drugModelList.generic,
                  style: durggenericstyle,
                ),
              ),
              Padding(
                padding: padding14,
                child: Text(drugModelList.brandName, style: drugbrandnamestyle),
              ),
              GestureDetector(
                onTap: () {
                  print("Clicked");
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding: const EdgeInsets.only(
                      left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: white, width: 1)),
                  child: othersbrand,
                ),
              )
            ],
          ),
        ),
        Positioned(
            right: 20.0,
            top: 10.0,
            child: Container(
                height: 70.0,
                width: 70.0,
                child: SvgPicture.asset(medicineicon))),
      ],
    );
  }

  druginfolist(String name, String inofo) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0, right: 5.0, left: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 2.0, color: Colors.grey)),
      child: ExpansionTile(
        
        title: Text(name),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
                child: Text(
                  inofo,
                  style: TextStyle(color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }

 
}
