import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';

class VisitingCardInformation extends StatefulWidget {
  @override
  _VisitingCardInformationState createState() =>
      _VisitingCardInformationState();
}

class _VisitingCardInformationState extends State<VisitingCardInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Information"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(7.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              images(context),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 3.0),
                child: Text(
                  "Information",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              textset(context, 'Dr.Name', "asset/svg/account_icon.svg"),
              textset(
                  context, 'Specalizaition', "asset/svg/organization_icon.svg"),
              textset(context, 'Discrict', "asset/svg/address_icon.svg"),
              textset(context, 'Thana', "asset/svg/address_icon.svg"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget images(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.height,
      height: 170.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "asset/images/carousel_covid_discount.png",
            fit: BoxFit.contain,
          )));
}

Widget textset(BuildContext context, String title, String svg) {
  return Container(
    margin: const EdgeInsets.only(top: 8.0),
    width: MediaQuery.of(context).size.width,
    height: 40.0,
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 3.0),
          height: 30.0,
          width: 25.0,
          child: SvgPicture.asset(svg),
        ),
        Text(
          title,
          style: TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
