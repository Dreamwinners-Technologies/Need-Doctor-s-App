import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';

// ignore: must_be_immutable
class GenericSearch extends StatefulWidget {
  GenericSearch(List<String> genericList) {
    this.genericList = genericList;
  }

  List<String> genericList;

  @override
  _GenericSearchState createState() => _GenericSearchState(genericList);
}

class _GenericSearchState extends State<GenericSearch> {
  _GenericSearchState(List<String> genericList) {
    this.genericList = genericList;
    size=0;
    // this.drugListResponse = drugListResponse;
  }

  List<String> genericList;

  //Checkbox
  bool isChecked = false;

  //Controller
  TextEditingController searchController = TextEditingController();

  //selecteditem:
  var selectBrand, selectGeneric;

  void searchOption() async {
    print("search");
    String genericName = searchController.text;
    print(genericName);

    List<String> genericList = await getGenericList(genericName: genericName);

    if (genericList != null) {
      setState(() {
        this.genericList = genericList;
      });
    }
  }

  int size;

  String getsvg = "asset/svg/search_icon.svg";

  @override
  Widget build(BuildContext context) {
    if(genericList!=null){
      size = genericList.length;
    }

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
            customSearchWidget(
                title: "Search...",
                controller: searchController,
                context: context,
              callback: searchOption
            ),
            //Search Item:
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                margin: EdgeInsets.only(left: 12, top: 10.0, bottom: 10.0),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: size,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return genericitem(genericList[index], context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
