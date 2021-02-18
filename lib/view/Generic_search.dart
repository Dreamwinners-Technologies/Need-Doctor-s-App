import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';



// ignore: must_be_immutable
class GenericSearch extends StatefulWidget {


  @override
  _GenericSearchState createState() => _GenericSearchState();
}

class _GenericSearchState extends State<GenericSearch> {
  //Checkbox
  bool isChecked = false;
  //Controller
  TextEditingController searchcontroller = TextEditingController();
  //selecteditem:
  var selectBrand, selectGeneric;

  _GenericSearchState(){
    //this.drugListResponse = drugListResponse;
  }

 // DrugListResponse drugListResponse;
  String getsvg = "asset/svg/search_icon.svg";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Search by Generic"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 12.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //customSearchWidget(this.searchcontroller, context),
            //Search Item:
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                margin: EdgeInsets.only(left: 12, top: 10.0, bottom: 10.0),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                  // itemCount: genericListResponse.totalItem,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return genericitem(index);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}


