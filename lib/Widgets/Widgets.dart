import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Admin/ModeratorListResponse.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Card/OwnCardResponse.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/AddMedicine.dart';
import 'package:need_doctors/view/AddOwnCard.dart';
import 'package:need_doctors/view/Drag_Details.dart';
import 'package:need_doctors/view/Generic_search.dart';
import 'package:need_doctors/view/Moderator.dart';
import 'package:need_doctors/view/SearchMedicine.dart';
import 'package:need_doctors/view/VisitingCard_Screen.dart';

FlutterSecureStorage storage = FlutterSecureStorage();
//Home Items Widget:
homeItemWidget(String svg, String title, BuildContext context) {
  return Material(
    child: InkWell(
      onTap: () async {
        print(MediaQuery.of(context).size.height);
        if (title == 'Search Medicien') {
          DrugListResponse drugListResponse =
              await getDrugList(pageSize: 250, pageNo: 0);

          if (drugListResponse != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchMedicine(drugListResponse)));
          } else {
            sendToast("Something went wrong");
            throw new Exception("Something wrong");
          }
        } else if (title == 'Drug by Generic') {
          print(1);

          List<String> genericList = await getGenericList();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GenericSearch(genericList)));
        } else if (title == 'Add Own Card') {
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
        } else if (title == 'Doctor Card') {
          CardListResponse cardListResponse =
              await getCardList(pageNo: 0, pageSize: 500);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VisitingCardList(
                isAdmin: false,
                cardListResponse: cardListResponse,
              ),
            ),
          );
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
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
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                height: 50.0,
                width: 50.0,
                child: SvgPicture.asset(
                  svg,
                  color: primaryColor,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

controlwidget(String svg, String title, BuildContext context) {
  return Material(
    child: InkWell(
      onTap: () async {
        print(MediaQuery.of(context).size.width);
        print(MediaQuery.of(context).size.height);
        if (title == 'Add Moderator') {
          String hasAdminRole = await storage.read(key: 'jwtRoleUSER');
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
        } else if (title == 'Add Drug') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMedicine()));
        } else if (title == 'Add Visiting card') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCardPage()));
        }
      },
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              height: (MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 7)) /
                  3,
              width: (MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 7)) /
                  3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      height: 50.0,
                      width: 50.0,
                      child: SvgPicture.asset(
                        svg,
                        color: primaryColor,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 13,
                            color: primaryColor,
                          ),
                        ))
                  ]))),
    ),
  );
}

//TextField Widgets
buildTextField(
    TextEditingController controller, String labelText, String hintText) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    height: 65.0,
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: primaryLight,
      border: Border.all(color: primaryLight),
    ),
    child: TextField(
      controller: controller,
      style: TextStyle(color: white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          labelText: labelText,
          labelStyle: TextStyle(color: white, fontSize: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: white, fontSize: 15),
          border: InputBorder.none),
    ),
  );
}

//Custom SearchBar
customSearchWidget(
    {String title,
    TextEditingController controller,
    BuildContext context,
    VoidCallback callback}) {
  return Center(
    child: Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      margin: EdgeInsets.only(left: 12.0, top: 14.0),
      decoration: BoxDecoration(
          color: Color(0xffF5F3F3), borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            maxLengthEnforced: false,
            decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB2B2B2)),
                hintText: title,
                border: InputBorder.none,
                labelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(14.0),
              height: MediaQuery.of(context).size.width * .12,
              width: MediaQuery.of(context).size.width * .12,
              decoration: BoxDecoration(
                  color: Color(0xffF5F3F3),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: GestureDetector(
                  // onTap: () async {
                  //   print("search");
                  //   var name = controller.text;
                  //
                  //   CardListResponse cards =
                  //       await getCardList(name: name, pageNo: 0, pageSize: 100);
                  // },
                  onTap: callback,
                  child: SvgPicture.asset("asset/svg/search_icon.svg")),
            ),
          )
        ],
      ),
    ),
  );
}

//Medicine Search item:
medicineitem(
    List<DrugModelList> drugModelList, int index, BuildContext context) {
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
              builder: (context) => DragDetails(drugModelList[index], medicineType)));
    },
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,right: 15.0),
                  width: 60.0,
                  height: 60.0,
                  child: SvgPicture.asset(
                    medicineType,
                    color: primaryColor,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            drugModelList[index].name,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4, bottom: 4),
                          child: Text(
                            drugModelList[index].packSize,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      drugModelList[index].generic,
                      style: TextStyle(fontSize: 15, color: Color(0xff464646)),
                    ),
                    Text(
                      drugModelList[index].type,
                      style: TextStyle(fontSize: 15, color: Color(0xff464646)),
                    ),
                    Text(
                      drugModelList[index].brandName,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.info,
                size: 30,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

doctoritem(String name, String specality, String address, int index,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(index);
    },
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 90.0,
        margin: EdgeInsets.only(bottom: 5.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            Text(
              specality,
              style: TextStyle(fontSize: 15.0, color: primaryColor),
            ),
            Text(
              address,
              style: TextStyle(fontSize: 15.0, color: Color(0xff464646)),
            ),
          ],
        ),
      ),
    ),
  );
}

genericitem(String name, BuildContext context) {
  if (name == null) {
    return;
  }

  return GestureDetector(
    onTap: () async {
      print(0);
      DrugListResponse drugListResponse =
          await getDrugList(pageSize: 250, pageNo: 0, generic: name);

      if (drugListResponse != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchMedicine(drugListResponse)));
      } else {
        sendToast("Something went wrong");
        throw new Exception("Something wrong");
      }
    },
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 50.0,
        margin: EdgeInsets.only(bottom: 0.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ],
        ),
      ),
    ),
  );
}

//Medicine Search item:
managemedicineitem(String image, String title, String category, String how,
    String cName, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(index);
    },
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 50.0,
        margin: EdgeInsets.only(bottom: 0.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ooo',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ],
        ),
      ),
    ),
  );
}
