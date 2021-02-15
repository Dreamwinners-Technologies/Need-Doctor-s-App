import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/Search%20Medicien.dart';
import 'package:need_doctors/view/VisitingCard_Screen.dart';

//Home Items Widget:
homeitemwidget(String svg, String title, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (title == 'Search Medicien') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchMedicien()));
      } else if (title == 'Add Card') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddCard()));
      } else if (title == 'Doctor Card') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VisitingCardList()));
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
            height: 108.0,
            width: 108.0,
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
                          fontSize: 12,
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
        border: Border.all(color: primaryLight)),
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
customsearchWidget(TextEditingController controller, BuildContext context) {
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
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: Color(0xffF5F3F3),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: SvgPicture.asset("asset/svg/search_icon.svg"),
            ),
          )
        ],
      ),
    ),
  );
}

//Medicine Search item:
medicineitem(String image, String title, String category, String how,
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
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  category,
                  style: TextStyle(fontSize: 15, color: Color(0xff464646)),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  how,
                  style: TextStyle(fontSize: 15, color: Color(0xff464646)),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  cName,
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

moderator(String image, String title, String phone, String Ocupation,
    int index, BuildContext context) {
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
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  phone,
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  Ocupation,
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
