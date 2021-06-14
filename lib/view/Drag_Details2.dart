import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/org_data/text_style.dart';

import 'SearchMedicineNew.dart';

// ignore: must_be_immutable
class DragDetails2 extends StatefulWidget {
  DragDetails2(DrugDbModel drugModelList, String medicineType) {
    this.drugModelList = drugModelList;
    medicineTypeIcon = medicineType;
  }

  DrugDbModel drugModelList;
  String medicineTypeIcon;

  @override
  _DragDetailsState createState() =>
      _DragDetailsState(drugModelList, medicineTypeIcon);
}

class _DragDetailsState extends State<DragDetails2> {
  _DragDetailsState(DrugDbModel drugModelList, String medicineTypeIcon) {
    this.drugModelList = drugModelList;
    this.medicineTypeIcon = medicineTypeIcon;
  }

  DrugDbModel drugModelList;
  String medicineTypeIcon;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double _height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double _weight = MediaQuery.of(context).size.width;
    String name = drugModelList.brandName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "Details of $name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 5.0),
        height: _height,
        width: _weight,
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            drugInfoHeader(_weight, _height),
            Column(
              children: [
                drugInfoList(
                  drugModelList.indication,
                  'Indications',
                ),
                drugInfoList(
                  drugModelList.adultDose,
                  'Adult Dose',
                ),
                drugInfoList(
                  drugModelList.childDose,
                  'Child Dose',
                ),
                drugInfoList(
                  drugModelList.renalDose,
                  'Renal Dose',
                ),
                drugInfoList(
                  drugModelList.administration,
                  'Administration',
                ),
                drugInfoList(
                  drugModelList.contraIndication,
                  'Contraindications',
                ),
                drugInfoList(
                  drugModelList.sideEffect,
                  'SideEffects',
                ),
                drugInfoList(
                  drugModelList.precaution,
                  'Precautions And Warnings',
                ),
                drugInfoList(
                  drugModelList.pregnancyCategoryNote,
                  'Pregnancy And Lactation',
                ),
                drugInfoList(
                  "",
                  'Therapeutic Class',
                ),
                drugInfoList(
                  drugModelList.modeOfAction,
                  'Mode Of Action',
                ),
                drugInfoList(
                  drugModelList.interaction,
                  'Interaction',
                ),
                drugInfoList(
                  "Pack Size" +
                      drugModelList.packsize +
                      "\nUnit Price: " +
                      drugModelList.price,
                  'Pack Size And Price',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  drugInfoHeader(double _weight, double _height) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 12.0, bottom: 10.0),
          color: primaryColor,
          width: _weight,
          height: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: TextSpan(
                      text: drugModelList.brandName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' ${drugModelList.packsize}',
                            style: TextStyle(fontSize: 12, color: Colors.white))
                      ]),
                ),
              ),
              Text(drugModelList.form, style: drugtypestyle),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: padding14,
                child: Text(
                  drugModelList.genericName,
                  style: durggenericstyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: padding14,
                child: Text(drugModelList.brandName, style: drugbrandnamestyle),
              ),
              GestureDetector(
                onTap: () async {
                  print("Clicked");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchMedicineNew(
                                false,
                                generic: drugModelList.genericName,
                              )));
                  // DrugListResponse drugListResponse = await getDrugList(
                  //     pageSize: 250, pageNo: 0, generic: drugModelList.generic);
                  //
                  // if (drugListResponse != null) {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               SearchMedicine(drugListResponse)));
                  // } else {
                  //   sendToast("Something went wrong");
                  //   throw new Exception("Something wrong");
                  // }
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
          child: Hero(
            tag: drugModelList.brandId,
            child: Container(
              height: 70.0,
              width: 70.0,
              child: SvgPicture.asset(
                medicineTypeIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  drugInfoList(String info, String name) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0, right: 5.0, left: 5.0),
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 2.0, color: Colors.grey)),
      child: ConfigurableExpansionTile(
        animatedWidgetFollowingHeader:
            const Icon(Icons.expand_more, color: Colors.black),
        header: Flexible(
            fit: FlexFit.tight,
            child: Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold))),
        children: [
          Align(
              heightFactor: 1.2,
              alignment: Alignment.centerLeft,
              child: Text(info,
                  style: TextStyle(color: Colors.black, fontSize: 15.0))),
        ],
      ),
    );
  }
}