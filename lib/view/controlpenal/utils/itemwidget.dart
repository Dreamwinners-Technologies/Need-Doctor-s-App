import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Admin/ModeratorListResponse.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/AddMedicien/AddMedicine.dart';
import 'package:need_doctors/view/Moderator.dart';
import 'package:need_doctors/view/medicien_search/SearchMedicineNew.dart';
import 'package:need_doctors/view/visitingCard/VisitingCard_ScreenNew.dart';

FlutterSecureStorage storage = FlutterSecureStorage();

controlwidget(String svg, String title, BuildContext context) {
  return Material(
    child: InkWell(
      onTap: () async {
        print(MediaQuery.of(context).size.width);
        print(MediaQuery.of(context).size.height);
        if (title == 'Add Moderator') {
          String hasAdminRole = await storage.read(key: 'jwtRoleADMIN');
          String hasSuperAdminRole =
              await storage.read(key: 'jwtRoleSUPER_ADMIN');
          print(hasAdminRole);
          List<ModeratorListResponse> moderatorList = await getModeratorList();

          if (hasAdminRole != null || hasSuperAdminRole != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModeratorPage(moderatorList)));
          } else {
            sendToast('You are not permitted to do this operation');
            throw new Exception('You are not permitted to do this operation');
          }
        } else if (title == 'Add Medicien') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMedicine()));
        } else if (title == 'Add Visiting card') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCardPage()));
        } else if (title == 'Edit Drug') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SearchMedicineNew(true)));
        } else if (title == 'Edit Visiting Card') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VisitingCardListNew(
                        isAdmin: true,
                      )));
        }
      },
      child: Card(
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
                  color: primarycolor,
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff333333),
                      ),
                    ),
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
