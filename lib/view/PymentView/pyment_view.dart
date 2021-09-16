import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

class PymentView extends StatefulWidget {
  const PymentView({Key key}) : super(key: key);

  @override
  _PymentViewState createState() => _PymentViewState();
}

class _PymentViewState extends State<PymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: sText("Pyment", white, 15.0, FontWeight.bold),
      ),
      body: pymentBody(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: sText("Complate Appointment Process", primaryColor, 14.0,
                    FontWeight.bold),
              ),
              MaterialButton(
                  minWidth: 60.0,
                  height: 30.0,
                  child: sText("Done", primaryColor, 14.0, FontWeight.bold),
                  color: whitecolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {})
            ],
          ),
          height: 50.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                primaryColor.withOpacity(0.4),
                primaryLight.withOpacity(0.5)
              ])),
        ),
      ),
    );
  }

  Widget pymentBody() {
    return Container(
        width: double.infinity,
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(14.0),
            padding: EdgeInsets.all(14.0),
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(colors: [
                  primaryColor.withOpacity(0.4),
                  primaryLight.withOpacity(0.5)
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: sText(
                            "Paitent Name", whitecolor, 20.0, FontWeight.bold)),
                    SizedBox(width: 20.0),
                    Container(
                      alignment: Alignment.center,
                      child: sText("Cash", primaryColor, 14.0, FontWeight.bold),
                      height: 25.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20.0)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sText("Age: 18", whitecolor, 15.0, FontWeight.bold),
                    SizedBox(width: 10.0),
                    sText("Gender: Male", whitecolor, 15.0, FontWeight.bold),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sText("Doctor", primaryLight, 12.0, FontWeight.bold),
                        sText("Doctor Name", blackcolor, 15.0, FontWeight.bold),
                      ],
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sText("Date", secondaryColor, 12.0, FontWeight.bold),
                        sText("20 jun 2021", red, 15.0, FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: whitecolor, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70.0,
                  width: 5.0,
                  decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  alignment: Alignment.center,
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: red)),
                  child: Icon(
                    Icons.close,
                    color: red,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: mText(
                      "NB: Please check all the infromation. Because you can not change or update any information after complate the proccess",
                      blackcolor.withOpacity(0.7),
                      12.0,
                      FontWeight.bold),
                )),
              ],
            ),
          )
        ]));
  }
}
