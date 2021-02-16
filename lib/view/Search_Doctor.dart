import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/items/objectdata.dart';

class SearchDoctor extends StatefulWidget {
  @override
  _SearchDoctorState createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  //Checkbox
  bool isChecked = false;
  //Controller
  TextEditingController searchcontroller = TextEditingController();
  //selecteditem:
  var selectdis, selectthan, selectspeacl;

  get thanalist => null; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Column(
            children: [
              customsearchWidget(this.searchcontroller, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: primaryLight,
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val;
                      });
                    },
                    checkColor: white,
                  ),
                  Text(
                    "Search by",
                    style: TextStyle(
                        fontSize: 18,
                        color: this.isChecked == true
                            ? primaryColor
                            : Color(0xff626161)),
                  )
                ],
              ),

              Visibility(
                visible: this.isChecked == true ? true : false,
                child: FadeAnimation(
                  1,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8.0),
                            margin: EdgeInsets.only(
                                left: 12.0, top: 10.0, bottom: 8.0),
                            height: 38.0,
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: primaryColor, width: 1.5)),
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: this.selectdis,
                              onChanged: (val) {
                                setState(() {
                                  this.selectdis = val;
                                });
                              },
                              items: thanalist.map((val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: primaryColor,
                              ),
                              iconSize: 35.0,
                              hint: Text(
                                'District',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              isExpanded: true,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 8.0,
                            ),
                            margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
                            height: 38.0,
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: primaryColor, width: 1.5)),
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: this.selectthan,
                              onChanged: (val) {
                                setState(() {
                                  this.selectthan = val;
                                });
                              },
                              items: thanatlist.map((val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: primaryColor,
                              ),
                              iconSize: 35.0,
                              hint: Text(
                                'Thana',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              isExpanded: true,
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        margin: EdgeInsets.only(left: 12.0, bottom: 8.0),
                        height: 38.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: primaryColor, width: 1.5)),
                        child: DropdownButton(
                          underline: SizedBox(),
                          value: this.selectspeacl,
                          onChanged: (val) {
                            setState(() {
                              this.selectspeacl = val;
                            });
                          },
                          items: specalizationlist.map((val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: primaryColor,
                          ),
                          iconSize: 35.0,
                          hint: Text(
                            'Specality',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Item List:
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                margin: EdgeInsets.only(bottom: 10.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return doctoritem(
                        "Dr. Name", "Specality", "Address", index, context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget doctoritem(String s, String t, String u, int index, BuildContext context) {}
}
