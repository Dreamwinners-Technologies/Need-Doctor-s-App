import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/DrugDBModel.dart' as sqldb;
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/service/DrugDetails.dart' as NewDrugDetails;
import 'package:need_doctors/view/Drag_Details2.dart';
import 'package:need_doctors/view/EditMedicien/EditMedicine.dart';
import 'package:need_doctors/view/drug_details/Drag_Details.dart';
import 'package:page_transition/page_transition.dart';

medicineItem(List<sqldb.DrugDetails> drugModelList, isAdmin, int index,
    BuildContext context, _pagingController) {
  String medicineType;
  if (drugModelList[index].form == "Tablet" ||
      drugModelList[index].form == "Rapid Tablet") {
    medicineType = "asset/drugs/drug.svg";
  } else if (drugModelList[index].form == "Capsule") {
    medicineType = "asset/drugs/capsule.svg";
  } else if (drugModelList[index].form == "Suspension") {
    medicineType = "asset/drugs/suspension.svg";
  } else if (drugModelList[index].form == "Suppository") {
    medicineType = "asset/drugs/suppositories.svg";
  } else if (drugModelList[index].form == "IV Infusion" ||
      drugModelList[index].form == "Infusion") {
    medicineType = "asset/drugs/infusion.svg";
  } else if (drugModelList[index].form == "Cream") {
    medicineType = "asset/drugs/cream.svg";
  } else if (drugModelList[index].form == "Drop") {
    medicineType = "asset/drugs/drops.svg";
  } else if (drugModelList[index].form == "Syrup") {
    medicineType = "asset/drugs/syrup.svg";
  } else if (drugModelList[index].form == "Injection") {
    medicineType = "asset/drugs/syringe.svg";
  } else if (drugModelList[index].form == "Lotion") {
    medicineType = "asset/drugs/lotion.svg";
  } else {
    medicineType = "asset/drugs/tablets.svg";
  }

  return GestureDetector(
    onTap: () {
      print(index);
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: DragDetails(drugModelList[index], medicineType)));
    },
    child: Container(
      height: 115.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(width: 1, color: Color(0xffe7e7e7))),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 15.0),
                width: 60.0,
                height: 60.0,
                child: SvgPicture.asset(
                  medicineType,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: TextSpan(
                          text: drugModelList[index].brandName,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: primarycolor),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' ${drugModelList[index].strength}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ))
                          ]),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: sText(drugModelList[index].genericName,
                        blackcolor.withOpacity(0.7), 14.0, FontWeight.w500),
                  ),
                  Container(
                    width: 200.0,
                    child: sText(drugModelList[index].form,
                        blackcolor.withOpacity(0.7), 14.0, FontWeight.w500),
                  ),
                  Container(
                    width: 200.0,
                    child: sText(drugModelList[index].companyName,
                        blackcolor.withOpacity(0.9), 15.0, FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          visibleUnVisibleWidget(context, isAdmin, index, _pagingController),
        ],
      ),
    ),
  );
}

visibleUnVisibleWidget(context, isAdmin, int index, _pagingController) {
  if (isAdmin) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            onTap: () {
              print("Click");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditMedicine(_pagingController.itemList[index])));
            },
            child: Icon(
              Icons.edit,
              color: primarylight,
              size: 30,
            )),
        GestureDetector(
            onTap: () async {
              String drugId = _pagingController.itemList[index].drugId;
              print("Click");
              print(index);
              print(drugId);
              askDialog(context, 'Are You Sure?',
                  'You wants to delete this drug?', DialogType.ERROR, () async {
                MessageResponseModel messageResponse =
                    await deleteDrug(drugId: drugId);

                if (messageResponse != null) {
                  _pagingController.refresh();
                }
              });
            },
            child: Icon(
              Icons.delete,
              color: Colors.redAccent,
              size: 30,
            ))
      ],
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.info,
            size: 30,
            color: primarycolor.withOpacity(0.2),
          ),
        )
      ],
    );
  }
}

medicineItem2(List<NewDrugDetails.DrugDetails> drugModelList, isAdmin,
    int index, BuildContext context, _pagingController) {
  print(index.toString() + " name: " + drugModelList[index].name);
  String medicineType;
  if (drugModelList[index].type.toLowerCase().contains("tablet") ||
      drugModelList[index].type == "Rapid Tablet") {
    medicineType = "asset/drugs/drug.svg";
  } else if (drugModelList[index].type.toLowerCase().contains("capsule")) {
    medicineType = "asset/drugs/capsule.svg";
  } else if (drugModelList[index].type.toLowerCase().contains("suspension")) {
    medicineType = "asset/drugs/suspension.svg";
  } else if (drugModelList[index].type.toLowerCase().contains("suppository")) {
    medicineType = "asset/drugs/suppo.svg";
  } else if (drugModelList[index].type == "IV Infusion" ||
      drugModelList[index].type == "Infusion") {
    medicineType = "asset/drugs/infusion.svg";
  } else if (drugModelList[index].type.toLowerCase().contains("gel") ||
      drugModelList[index].type.toLowerCase().contains("cream") ||
      drugModelList[index].type.toLowerCase().contains("ointment")) {
    medicineType = "asset/drugs/cream.svg";
  } else if (drugModelList[index].type.toLowerCase().contains("drop")) {
    medicineType = "asset/drugs/drops.svg";
  } else if (drugModelList[index].type == "Syrup") {
    medicineType = "asset/drugs/syrup.svg";
  } else if (drugModelList[index].type == "Injection") {
    medicineType = "asset/drugs/syringe.svg";
  } else if (drugModelList[index].type == "Lotion") {
    medicineType = "asset/drugs/lotion.svg";
  } else {
    medicineType = "asset/drugs/tab.svg";
  }

  return GestureDetector(
    onTap: () {
      print(index);
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: DragDetails2(drugModelList[index], medicineType),
        ),
      );
    },
    child: Container(
      width: double.infinity,
      height: 115.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(width: 1, color: Color(0xffe7e7e7))),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 12.0),
                  width: 50.0,
                  height: 50.0,
                  child: SvgPicture.asset(
                    medicineType,
                  ),
                ),
                // Hero(
                //   tag: drugModelList[index].brandId,
                //   child: Container(
                //     margin: EdgeInsets.only(left: 10, right: 15.0),
                //     width: 60.0,
                //     height: 60.0,
                //     child: SvgPicture.asset(
                //       medicineType,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                            text: drugModelList[index].name,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                color: primarycolor),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${drugModelList[index].packSize}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        child: sText(drugModelList[index].generic,
                            blackcolor.withOpacity(0.7), 14.0, FontWeight.w500),
                      ),
                      Container(
                        width: 200.0,
                        child: sText(drugModelList[index].type,
                            blackcolor.withOpacity(0.7), 14.0, FontWeight.w500),
                      ),
                      Container(
                        width: 200.0,
                        child: sText(drugModelList[index].brandName,
                            blackcolor.withOpacity(0.9), 15.0, FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          visibleUnVisibleWidget(context, isAdmin, index, _pagingController),
        ],
      ),
    ),
  );
}
