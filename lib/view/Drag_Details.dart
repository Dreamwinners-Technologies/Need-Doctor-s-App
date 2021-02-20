import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'SearchMedicine.dart';

// ignore: must_be_immutable
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
    String name = drugModelList.name;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primaryColor,
          title: Text("Details of $name")),
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
                  drugModelList.indications,
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
                  drugModelList.contraindications,
                  'Contraindications',
                ),
                drugInfoList(
                  drugModelList.sideEffects,
                  'SideEffects',
                ),
                drugInfoList(
                  drugModelList.precautionsAndWarnings,
                  'Precautions And Warnings',
                ),
                drugInfoList(
                  drugModelList.pregnancyAndLactation,
                  'Pregnancy And Lactation',
                ),
                drugInfoList(
                  drugModelList.therapeuticClass,
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
                  drugModelList.packSizeAndPrice,
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
          padding: const EdgeInsets.only(left: 20.0, right: 12.0, bottom: 5.0),
          color: primaryColor,
          width: _weight,
          height: 140.0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      drugModelList.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        drugModelList.packSize,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
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
                  child:
                      Text(drugModelList.brandName, style: drugbrandnamestyle),
                ),
                GestureDetector(
                  onTap: () async {
                    print("Clicked");
                    DrugListResponse drugListResponse = await getDrugList(
                        pageSize: 250,
                        pageNo: 0,
                        generic: drugModelList.generic);

                    if (drugListResponse != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SearchMedicine(drugListResponse)));
                    } else {
                      sendToast("Something went wrong");
                      throw new Exception("Something wrong");
                    }
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
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold))),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(info,
                  style: TextStyle(color: Colors.black, fontSize: 15.0))),
        ],
      ),
    );
  }
}
