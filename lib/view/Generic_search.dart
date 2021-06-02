import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';

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
    // searchController.text = "";
    // String genericName = searchController.text;
    // print(genericName);
    //
    // List<String> genericList = await getGenericList(genericName: genericName);

    // if (genericList != null) {
    //   setState(() {
    //     // this.genericList = genericList;
    //   });
    // }
  }

  int size;

  String getsvg = "asset/svg/search_icon.svg";

  @override
  Widget build(BuildContext context) {
    if (genericList != null) {
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
            customSearchWidget1(
                title: "Search...",
                controller: searchController,
                context: context,
                callback: searchOption),
            //Search Item:
            FutureBuilder(
              future: getGenericList(genericName: searchController.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("Yes");
                  genericList = snapshot.data;

                  return Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      margin:
                          EdgeInsets.only(left: 12, top: 10.0, bottom: 10.0),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: genericList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return genericitem(genericList[index], context);
                          }),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  customSearchWidget1(
      {String title,
      TextEditingController controller,
      BuildContext context,
      VoidCallback callback}) {
    return Center(
      child: Container(
        height: 50.0,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        margin: EdgeInsets.only(left: 12.0, top: 14.0),
        decoration: BoxDecoration(
            color: Color(0xffF5F3F3),
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              // ignore: deprecated_member_use
              maxLengthEnforced: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB2B2B2)),
                  hintText: title,
                  border: InputBorder.none,
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(14.0),
                height: MediaQuery.of(context).size.width * .12,
                width: MediaQuery.of(context).size.width * .12,
                decoration: BoxDecoration(
                    color: Color(0xffF5F3F3),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: GestureDetector(
                    onTap: callback,
                    child: SvgPicture.asset("asset/svg/search_icon.svg")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Expanded
// (
// child: Container
// (
// height: MediaQuery.of(context).
// size.height / 1.4
// ,
// margin: EdgeInsets.only(left: 12
// ,
// top: 10.0
// ,
// bottom: 10.0
// )
// ,
// child: ListView.builder(physics: BouncingScrollPhysics
// (
// ),itemCount: size,scrollDirection: Axis.vertical,itemBuilder: (
// context, index) {
// return genericitem(genericList[index], context);
// })
// ,
// )
// ,
// )
