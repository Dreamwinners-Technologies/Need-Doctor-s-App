import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/org_data/text_style.dart';
import 'package:need_doctors/view/medicien_search/SearchMedicineNew.dart';

drugInfoHeader(
  context,
  DrugDetails drugModelList,
  medicineTypeIcon,
  double _weight,
) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 20.0, right: 12.0, bottom: 10.0),
        color: primarycolor,
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
                    text: drugModelList.brandName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${drugModelList.form}',
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ]),
              ),
            ),
            sText(drugModelList.strength, primarylight, 14.0, FontWeight.bold),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: padding14,
              child: sText(
                  drugModelList.genericName, whitecolor, 15.0, FontWeight.bold),
            ),
            Padding(
              padding: padding14,
              child: sText(
                  drugModelList.companyName, whitecolor, 15.0, FontWeight.bold),
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
              },
              child: Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.only(
                    left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: Colors.greenAccent, width: 1)),
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
            ),
          ),
        ),
      ),
    ],
  );
}
