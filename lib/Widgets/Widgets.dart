import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/AddMedicine.dart';
import 'package:need_doctors/view/Drag_Details.dart';
import 'package:need_doctors/view/Moderator.dart';
import 'package:need_doctors/view/SearchMedicine.dart';
import 'package:need_doctors/view/TestPage.dart';
import 'package:need_doctors/view/VisitingCard_Screen.dart';

 FlutterSecureStorage storage = FlutterSecureStorage();
//Home Items Widget:
homeitemwidget(String svg, String title, BuildContext context) {
  return GestureDetector(
    onTap: () async {
      print(MediaQuery.of(context).size.height);
      if (title == 'Search Medicien') {

        DrugListResponse drugListResponse = await getDrugList(pageSize: 250, pageNo: 0);

        if(drugListResponse!=null){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchMedicine(drugListResponse)));
        }
        else {
          sendToast("Something went wrong");
          throw new Exception("Something wrong");
        }

      } else if (title == 'Drug by Generic') {
        print(1);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DropDownList()));
      } else if (title == 'Add Card') {
        print(1);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddCardPage()));
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
                (MediaQuery.of(context).size.width / 6)) /
            3,
        width: (MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width / 6)) /
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
              ),
            )
          ],
        ),
      ),
    ),
  );
}

controlwidget(String svg, String title, BuildContext context) {
  return GestureDetector(
    onTap: () async {
      print(MediaQuery.of(context).size.width);
      print(MediaQuery.of(context).size.height);
      if (title == 'Add Moderator')  {
        String hasAdminRole = await storage.read(key: 'jwtRoleADMIN');
        String hasSuperAdminRole = await storage.read(key: 'jwtRoleSUPER_ADMIN');
        print(hasAdminRole);
        if(hasAdminRole != null || hasSuperAdminRole!=null){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ModeratorPage()));
        }
        else {
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
  );
}

//TextField Widgets
buildTextField(
    TextEditingController controller, String labelText, String hintText) {
  return Container(
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
customSearchWidget(TextEditingController controller, BuildContext context) {
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
                hintText: 'Search...',
                border: InputBorder.none,
                labelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(14.0),
              height: MediaQuery.of(context).size.width*.12,
              width: MediaQuery.of(context).size.width*.12,
              decoration: BoxDecoration(
                  color: Color(0xffF5F3F3),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: GestureDetector(
                onTap: () async {
                  print("search");
                  var name = controller.text;

                  CardListResponse cards = await getCardList(name: name, pageNo: 0, pageSize: 100);



                },
                  child: SvgPicture.asset("asset/svg/search_icon.svg")),
            ),
          )
        ],
      ),
    ),
  );
}

//Medicine Search item:
medicineitem(List<DrugModelList> drugModelList, int index, BuildContext context) {

  String medicineType;
  if(drugModelList[index].type=="Tablet"){
    medicineType = "asset/svg/tablet.svg";
  }
  else {
    medicineType = "asset/svg/pills.svg";
  }


  return GestureDetector(
    onTap: () {
      print(index);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DragDetails(drugModelList[index])));
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
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.0),
              width: 60.0,
              height: 60.0,
              child: SvgPicture.asset(medicineType),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drugModelList[index].name,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  drugModelList[index].generic,
                  style: TextStyle(fontSize: 15, color: Color(0xff464646)),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  drugModelList[index].packSize,
                  style: TextStyle(fontSize: 15, color: Color(0xff464646)),
                ),
                SizedBox(
                  height: 4.0,
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
      ),
    ),
  );
}

//Doctor items:
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

//Medicine Search item:
managemedicineitem(String image, String title, String category, String how,
    String cName, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(index);
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
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.0),
              width: 60.0,
              height: 60.0,
              child: Image.asset(image),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "phone",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Ocupation",
                  style: TextStyle(fontSize: 20, color: Color(0xff464646)),
                ),
                SizedBox(
                  height: 4.0,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
