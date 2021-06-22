import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/OwnCardResponse.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/AddOwnCard.dart';
import 'package:need_doctors/view/generic_search/Generic_search.dart';
import 'package:need_doctors/view/medicien_search/SearchMedicineNew.dart';
import 'package:need_doctors/view/SearchMedicineNew2.dart';
import 'package:need_doctors/view/visitingCard/VisitingCard_ScreenNew.dart';

FlutterSecureStorage storage = FlutterSecureStorage();
//Home Items Widget:
homeItemWidget(String svg, String title, BuildContext context) {
  return Material(
    child: InkWell(
      onTap: () async {
        if (title == 'Search Medicine') {
          // DrugListResponse drugListResponse =
          //     await getDrugList(pageSize: 250, pageNo: 0);

          // if (drugListResponse != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchMedicineNew(false)));
          // } else {
          //   sendToast("Something went wrong");
          //   throw new Exception("Something wrong");
          // }
        } else if (title == 'Medicine by Generic') {
          print(1);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GenericSearch()));
        } else if (title == 'Add-Edit Own Card') {
          print(1);

          String hasDoctorRole = await storage.read(key: 'jwtRoleDOCTOR');

          if (hasDoctorRole != null) {
            OwnCardResponse ownCardResponse = await getOwnCard();

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddOwnCardPage(ownCardResponse)));
          } else {
            sendToast("Only Doctor Can add his own Visiting Card");
          }
        } else if (title == 'Search Doctor') {
          // CardListResponse cardListResponse =
          //     await getCardList(pageNo: 0, pageSize: 500);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VisitingCardListNew(
                isAdmin: false,
              ),
            ),
          );
        } else if (title == 'Update Research') {
          // DrugListResponse drugListResponse =
          //     await getDrugList(pageSize: 250, pageNo: 0);

          sendToast("The feature is coming soon.");
          // if (drugListResponse != null) {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SearchMedicineNew2(false)));
          // } else {
          //   sendToast("Something went wrong");
          //   throw new Exception("Something wrong");
          // }
        } else {
          sendToast("The feature is coming soon.");
        }
      },
      child: Card(
        //color: tea,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(width: 1, color: Color(0xffe7e7e7))),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          height: (MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 10)) /
              3,
          width: (MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 10)) /
              3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                height: 50.0,
                width: 50.0,
                child: SvgPicture.asset(
                  svg,
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sText(title, black, 12.0, FontWeight.w500),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
