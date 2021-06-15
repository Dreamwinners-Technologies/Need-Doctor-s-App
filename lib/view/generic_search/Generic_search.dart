import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

import 'package:need_doctors/view/generic_search/utils/list_view.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

// ignore: must_be_immutable
class GenericSearch extends StatefulWidget {
  GenericSearch();

  @override
  _GenericSearchState createState() => _GenericSearchState();
}

class _GenericSearchState extends State<GenericSearch> {
  _GenericSearchState();

  List<String> genericList;

  //Checkbox
  bool isChecked = false;

  //Controller
  TextEditingController searchController = TextEditingController();

  //selecteditem:
  var selectBrand, selectGeneric;

  void searchOption() {
    print("search");
    setState(() {});
  }

  int size;

  @override
  Widget build(BuildContext context) {
    if (genericList != null) {
      size = genericList.length;
    }

    return Scaffold(
        backgroundColor: primaryColor,
        //appbar
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: primaryColor,
            title:
                sText("Search by Generic", whitecolor, 19.0, FontWeight.bold)),
        body: myBody());
  }

  //full body
  myBody() {
    return Container(
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWidget(
            searchController: searchController,
            isWiritten: false,
            callback: searchOption,
          ),
          Container(
            height: 5.0,
          ),
          genericItemList(genericList, searchController)
        ],
      ),
    );
  }
}
