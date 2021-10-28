import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/AboutApp/AboutApp.dart';
import 'package:need_doctors/view/AddCardPublic/add_card_public.dart';
import 'package:need_doctors/view/Ambulance/Ambulance.dart';
import 'package:need_doctors/view/Appointment/apointment_tabsetup.dart';
import 'package:need_doctors/view/DoctorOptions/doctor_option.dart';
import 'package:need_doctors/view/EditVisitingcard/EditCard.dart';
import 'package:need_doctors/view/EmptyPage/EmptyPage.dart';
import 'package:need_doctors/view/MedicineByDisease/MedicineByDisease.dart';
import 'package:need_doctors/view/Prescription/presciption_setup.dart';
import 'package:need_doctors/view/PublicAddMedicine/public_add_medicine.dart';
import 'package:need_doctors/view/Treatment/Treatment.dart';
import 'package:need_doctors/view/UpdateResearch/UpdateResearch.dart';
import 'package:need_doctors/view/generic_search/Generic_search.dart';
import 'package:need_doctors/view/medicien_search/SearchMedicineNewNoSQL.dart';
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMedicineNewNoSQL(false)));
          // } else {
          //   sendToast("Something went wrong");
          //   throw new Exception("Something wrong");
          // }
        } else if (title == 'Medicine by Generic') {
          print(1);

          Navigator.push(context, MaterialPageRoute(builder: (context) => GenericSearch()));
        } else if (title == 'About App') {
          print(1);

          Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()));
        } else if (title == 'Doctor Point') {
          print(1);

          String hasDoctorRole = await storage.read(key: 'jwtRoleDOCTOR');

          if (hasDoctorRole != null) {
            print("Working 2");

            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => AddOwnCardPage(ownCardResponse)));
                builder: (context) => DoctorOption(),
              ),
            );
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
        } else if (title == 'Prescriptions') {
          // CardListResponse cardListResponse =
          //     await getCardList(pageNo: 0, pageSize: 500);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PrescriptionTabSetup(),
            ),
          );
        } else if (title == 'Appointment') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppoinmentTabSetup(),
            ),
          );
        } else if (title == 'Search Ambulance') {
          // CardListResponse cardListResponse =
          //     await getCardList(pageNo: 0, pageSize: 500);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ambulance(),
            ),
          );
        } else if (title == 'Treatment') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Treatment(),
            ),
          );
        } else if (title == 'Update Research') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateResearch(),
            ),
          );
        } else if (title == 'Medicine by Disease') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicineByDisease(),
            ),
          );
        } else if (title == 'Add Medicine') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PublicAddMedicine(),
            ),
          );
        } else if (title == 'Add Card') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCardPagePublic(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmptyPage(title),
            ),
          );
        }
      },
      child: Card(
        //color: tea,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), side: BorderSide(width: 1, color: Color(0xffe7e7e7))),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          height: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 10)) / 3,
          width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 10)) / 3,
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
