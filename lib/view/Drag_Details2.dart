import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/TextConstants.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/objectbox.g.dart';

// import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/service/generics-offline-model.dart';
import 'package:need_doctors/service/medicine-offline-model.dart';
import 'package:need_doctors/service/store_init.dart';
import 'package:need_doctors/view/BrandMedicineList/brand_medicine_list.dart';

// ignore: must_be_immutable
class DragDetails2 extends StatefulWidget {
  DragDetails2(MedicineOfflineModel medicineOfflineModel, String medicineType) {
    this.medicineOfflineModel = medicineOfflineModel;
    medicineTypeIcon = medicineType;
  }

  MedicineOfflineModel medicineOfflineModel;
  String medicineTypeIcon;

  @override
  _DragDetailsState createState() => _DragDetailsState(medicineOfflineModel, medicineTypeIcon);
}

class _DragDetailsState extends State<DragDetails2> {
  _DragDetailsState(MedicineOfflineModel medicineOfflineModel, String medicineTypeIcon) {
    this.medicineOfflineModel = medicineOfflineModel;
    this.medicineTypeIcon = medicineTypeIcon;

    getGenericData(this.medicineOfflineModel);
  }

  void getGenericData(MedicineOfflineModel medicineOfflineModel) async {
    BoxStoreGeneric boxStore = BoxStoreGeneric();
    var store = await boxStore.getGenericStore();

    var box = store.box<GenericsOfflineModel>();

    GenericsOfflineModel genericsOfflineModel;

    final query = (box.query(GenericsOfflineModel_.genericId.equals(medicineOfflineModel.genericId))).build();

    genericsOfflineModel = query.findFirst();
    query.close();

    this.genericsOfflineModel = genericsOfflineModel;

    setState(() {

    });
  }

  MedicineOfflineModel medicineOfflineModel;
  String medicineTypeIcon;
  GenericsOfflineModel genericsOfflineModel;

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
        title: sText("Details of ${medicineOfflineModel.brandName}", whitecolor, 18.0, FontWeight.bold),
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
                  genericsOfflineModel.indication,
                  'Symptoms of the Disease',
                ),

                drugInfoList(
                  genericsOfflineModel.adultDose + genericsOfflineModel.childDose + genericsOfflineModel.renalDose,
                  'Medicine Dosage',
                ),
                // drugInfoList(
                //   drugModelList.childDose,
                //   'Child Dose',
                // ),
                // drugInfoList(
                //   drugModelList.renalDose,
                //   'Renal Dose',
                // ),
                drugInfoList(
                  genericsOfflineModel.administration,
                  'Medicine Administration',
                ),
                drugInfoList(
                  genericsOfflineModel.contraIndication,
                  'Medicine Contraindications',
                ),
                drugInfoList(
                  genericsOfflineModel.sideEffect,
                  'Side Effects on Human',
                ),
                drugInfoList(
                  genericsOfflineModel.pregnancyCategoryNote,
                  'Safety Measure And Caution',
                ),
                drugInfoList(
                  genericsOfflineModel.pregnancyCategoryNote,
                  'Pregnancy And Lactation',
                ),
                // drugInfoList(
                //   "",
                //   'Therapeutic Class',
                // ),
                drugInfoList(
                  genericsOfflineModel.modeOfAction,
                  'Mode Of Work',
                ),
                drugInfoList(
                  genericsOfflineModel.interaction,
                  'Interactivity',
                ),
                drugInfoList(
                  medicineOfflineModel.packedSize + ".\nUnit Price: " + medicineOfflineModel.price + " tk",
                  'Price And Pack Size',
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
                    text: medicineOfflineModel.brandName, style: kTextStyle, //TextStyle(
                    //color: Colors.white,
                    //fontSize: 24.0,
                    //),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  ${medicineOfflineModel.form}',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.yellow,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        //TextStyle(fontSize: 12, color: Colors.white)
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                medicineOfflineModel.strength,
                style: TextStyle(fontFamily: 'Gilroy', color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                //TextStyle(fontSize: 12, color: Colors.white)
              ),
              // Text(
              //   drugModelList.type,
              //   style: TextStyle(
              //     color: Colors.yellow,
              //     fontSize: 17.0,
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: padding14,
                child: Text(
                  medicineOfflineModel.genericName,
                  style: kTextStyle4, //durggenericstyle,

                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: padding14,
                child: Text(medicineOfflineModel.companyName, style: kTextStyle3),
              ),
              GestureDetector(
                onTap: () async {
                  print("Clicked");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BrandMedicineList(
                        generic: medicineOfflineModel.genericName,
                      ),
                    ),
                  );
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
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: white, width: 1),
                  ),
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
            tag: medicineOfflineModel.companyName,
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
      margin: const EdgeInsets.only(top: 8.0, right: 5.0, left: 5.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 7.0, bottom: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 2.0, color: Colors.grey)),
      child: ConfigurableExpansionTile(
        animatedWidgetFollowingHeader: const Icon(Icons.expand_more, color: Colors.black),
        header: Flexible(
            fit: FlexFit.tight,
            child: Text(
              name,
              style: kCardMainText2, //TextStyle(
              //color: Colors.black,
              //fontSize: 16.0,
              //fontWeight: FontWeight.bold)
            )),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                info,
                style: kTripTextSelected, //TextStyle(color: Colors.black, fontSize: 15.0)
              )),
        ],
      ),
    );
  }
}
