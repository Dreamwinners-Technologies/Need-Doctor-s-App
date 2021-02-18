import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';

class DragDetails extends StatefulWidget {
  DragDetails(DrugModelList drugModelList){
    this.drugModelList = drugModelList;
  }
  DrugModelList drugModelList;

  @override
  _DragDetailsState createState() => _DragDetailsState(drugModelList);
}

class _DragDetailsState extends State<DragDetails> {
  _DragDetailsState(DrugModelList drugModelList){
    this.drugModelList = drugModelList;
  }
  DrugModelList drugModelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Container(
          height: 55.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //Navigator.of(context).pop();
                  print("Clicek");
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  child: CircleAvatar(
                      backgroundColor: white,
                      child: Container(
                        height: 24.0,
                        width: 24.0,
                        child: SvgPicture.asset("asset/svg/left-arrow.svg"),
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 66.0),
                  child: Text(
                    drugModelList.name,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0),
                color: primaryColor,
                width: MediaQuery.of(context).size.width,
                height: 130.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(drugModelList.type,
                                style: TextStyle(
                                  color: primaryLight,
                                  fontSize: 16.0,
                                )),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              drugModelList.generic,
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                        Container(
                            margin:
                                const EdgeInsets.only(left: 55.0, right: 10.0),
                            height: 65.0,
                            width: 70.0,
                            child: SvgPicture.asset(
                                "asset/svg/medicines_icon.svg"))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(drugModelList.brandName,
                          style: TextStyle(
                            color: white,
                            fontSize: 16.0,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Cliced");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 8.0, left: 8.0),
                        padding: const EdgeInsets.only(
                            left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: white, width: 1)),
                        child: Text(
                          "Others Brand",
                          style: TextStyle(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Drag List:

              Column(
                children: [
                  drugdetails(drugModelList.indications),
                  drugdetails(drugModelList.adultDose),
                  drugdetails(drugModelList.childDose),
                  drugdetails(drugModelList.renalDose),
                  drugdetails(drugModelList.administration),
                  drugdetails(drugModelList.contraindications),
                  drugdetails(drugModelList.sideEffects),
                  drugdetails(drugModelList.precautionsAndWarnings),
                  drugdetails(drugModelList.pregnancyAndLactation),
                  drugdetails(drugModelList.therapeuticClass),
                  drugdetails(drugModelList.modeOfAction),
                  drugdetails(drugModelList.interaction),
                  drugdetails(drugModelList.packSizeAndPrice),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  drugdetails(String s) {
    return Text(
        s
    );
  }
}
