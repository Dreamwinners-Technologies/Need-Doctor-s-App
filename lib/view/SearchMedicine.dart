import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
//

// ignore: must_be_immutable
class SearchMedicine extends StatefulWidget {
  SearchMedicine(DrugListResponse drugListResponse) {
    this.drugListResponse = drugListResponse;
  }

  DrugListResponse drugListResponse;
  @override
  _SearchMedicineState createState() => _SearchMedicineState(drugListResponse);
}

class _SearchMedicineState extends State<SearchMedicine> {
  //Checkbox
  bool isChecked = false;
  //Controller
  TextEditingController searchController = TextEditingController();
  //selecteditem:
  var selectBrand, selectGeneric;

  _SearchMedicineState(DrugListResponse drugListResponse) {
    this.drugListResponse = drugListResponse;
  }

  void searchOption() async {
    print("search");
    String name = searchController.text;
    print(name);
    DrugListResponse drugListResponse =
        await getDrugList(name: name, pageNo: 0, pageSize: 250);

    if (drugListResponse != null) {
      setState(() {
        this.drugListResponse = drugListResponse;
      });
    }
  }

  DrugListResponse drugListResponse;
  String getsvg = "asset/svg/search_icon.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Medicines"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 12.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSearchWidget(
                title: "Search...",
                controller: searchController,
                context: context,
                callback: searchOption),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      margin:
                          EdgeInsets.only(left: 12.0, top: 10.0, bottom: 8.0),
                      height: 38.0,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: primaryColor, width: 1.5)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: this.selectBrand,
                        onChanged: (val) {
                          setState(() {
                            this.selectBrand = val;
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
                          'Brand',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
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
                          border: Border.all(color: primaryColor, width: 1.5)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: this.selectBrand,
                        onChanged: (val) {
                          setState(() {
                            this.selectBrand = val;
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
                          'Brand',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        isExpanded: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Search Item:
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                margin: EdgeInsets.only(left: 12, top: 5.0, bottom: 10.0),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: drugListResponse.totalItem,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return medicineitem(
                          drugListResponse.drugModelList, index, context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget medicineitem(List<DrugModelList> drugModelList, int index, BuildContext context
      ) {}
}
