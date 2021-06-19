import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/view/drug_details/Drag_Details.dart';
import 'package:need_doctors/view/EditMedicien/EditMedicine.dart';

medicineItem(List<DrugModelList> drugModelList, isAdmin, int index,
    BuildContext context, _pagingController) {
  String medicineType;
  if (drugModelList[index].type == "Tablet" ||
      drugModelList[index].type == "Rapid Tablet") {
    medicineType = "asset/svg/types/tablet.svg";
  } else if (drugModelList[index].type == "Capsule") {
    medicineType = "asset/svg/types/capsule.svg";
  } else if (drugModelList[index].type == "Suspension") {
    medicineType = "asset/svg/types/suspension.svg";
  } else if (drugModelList[index].type == "Suppository") {
    medicineType = "asset/svg/types/suppository.svg";
  } else if (drugModelList[index].type == "IV Infusion" ||
      drugModelList[index].type == "Infusion") {
    medicineType = "asset/svg/types/infusion.svg";
  } else if (drugModelList[index].type == "Cream") {
    medicineType = "asset/svg/types/cream.svg";
  } else if (drugModelList[index].type == "Drop") {
    medicineType = "asset/svg/types/drop.svg";
  } else if (drugModelList[index].type == "Syrup") {
    medicineType = "asset/svg/types/syrup.svg";
  } else {
    medicineType = "asset/svg/types/tablet.svg";
  }

  return GestureDetector(
    onTap: () {
      print(index);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DragDetails(drugModelList[index], medicineType)));
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
              Hero(
                tag: drugModelList[index].drugId,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 15.0),
                  width: 60.0,
                  height: 60.0,
                  child: SvgPicture.asset(
                    medicineType,
                    color: primarycolor,
                  ),
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
                                  color: primarylight,
                                ))
                          ]),
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
            color: primarycolor,
          ),
        )
      ],
    );
  }
}
