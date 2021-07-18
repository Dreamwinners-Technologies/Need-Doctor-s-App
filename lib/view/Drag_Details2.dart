import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/TextConstants.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
// import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/view/medicien_search/SearchMedicineNewNoSQL.dart';


// ignore: must_be_immutable
class DragDetails2 extends StatefulWidget {
  DragDetails2(DrugDetails drugModelList, String medicineType) {
    this.drugModelList = drugModelList;
    medicineTypeIcon = medicineType;
  }

  DrugDetails drugModelList;
  String medicineTypeIcon;

  @override
  _DragDetailsState createState() =>
      _DragDetailsState(drugModelList, medicineTypeIcon);
}

class _DragDetailsState extends State<DragDetails2> {
  _DragDetailsState(DrugDetails drugModelList, String medicineTypeIcon) {
    this.drugModelList = drugModelList;
    this.medicineTypeIcon = medicineTypeIcon;
  }

  DrugDetails drugModelList;
  String medicineTypeIcon;

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
        title: sText("Details of ${drugModelList.brandName}", whitecolor, 18.0,
            FontWeight.bold),
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
                  drugModelList.packSizeAndPrice,
                  'Pack Size And Price',
                ),
                // drugInfoList(
                //   "Pack Size" +
                //       drugModelList.packSize +
                //       "\nUnit Price: " +
                //       drugModelList.packSizeAndPrice,
                //   'Pack Size And Price',
                // ),
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
                      text: drugModelList.name,
                      style: kTextStyle,//TextStyle(
                        //color: Colors.white,
                        //fontSize: 24.0,
                      //),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' ${drugModelList.packSize}',
                            style: kTextStyle2,//TextStyle(fontSize: 12, color: Colors.white)
                       ),
                      ]),
                ),
              ),
              Text(drugModelList.type, style: drugtypestyle),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: padding14,
                child: Text(
                  drugModelList.generic,
                  style: kTextStyle4,//durggenericstyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: padding14,
                child: Text(drugModelList.brandName, style: kTextStyle3),
              ),
              GestureDetector(
                onTap: () async {
                  print("Clicked");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchMedicineNewNoSQL(
                                false,
                                generic: drugModelList.generic,
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
            tag: drugModelList.brandName,
            child: Container(
              height: 70.0,
              width: 70.0,
              child: SvgPicture.asset(
                medicineTypeIcon,
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
                style: kCardMainText2,//TextStyle(
                    //color: Colors.black,
                    //fontSize: 16.0,
                    //fontWeight: FontWeight.bold)
     )),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(info,
                  style: kTripTextSelected,//TextStyle(color: Colors.black, fontSize: 15.0)
                 )
          ),
        ],
      ),
    );
  }
}
