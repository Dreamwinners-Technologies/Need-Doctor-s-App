import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
// import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/service/NoSQLConfig.dart';
import 'package:need_doctors/view/medicien_search/utils/item.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

// ignore: must_be_immutable
class SearchMedicineNewNoSQL extends StatefulWidget {
  SearchMedicineNewNoSQL(bool isAdmin, {String generic}) {
    this.isAdmin = isAdmin;
    this.generic = generic;
  }

  bool isAdmin;
  String generic;

  @override
  _SearchMedicineNewNoSQLState createState() =>
      _SearchMedicineNewNoSQLState(isAdmin, generic: generic);
}

class _SearchMedicineNewNoSQLState extends State<SearchMedicineNewNoSQL> {
  //Checkbox
  bool isChecked = false;
  TextEditingController searchController = TextEditingController();
  var selectBrand, selectGeneric;

  _SearchMedicineNewNoSQLState(bool isAdmin, {String generic}) {
    this.isAdmin = isAdmin;
    this.generic = generic;
  }

  final _pagingController = PagingController<int, DrugDetails>(
    // 2
    firstPageKey: 0,
  );

  bool isAdmin = true;
  String generic;

  @override
  Future<void> initState() {
    // 3

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    NoSQLConfig noSQLConfig = NoSQLConfig();

    print("search");
    await noSQLConfig.save50Data();

    var box = Hive.box<DrugDetails>("drugBoxTest2");

    print(box.values.length);

    print("search2");

    try {
      List<DrugDetails> drugDetailsList = box.values.toList();

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      // final isLastPage = newPage.lastPage;
      // final newItems = newPage.drugModelList;

      bool isLastPage = true;

      final newItems = drugDetailsList;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(drugDetailsList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      // 4
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: 'medicine',
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primaryColor,
          title: Text("Medicine"),
        ),
        body: myBody(size),
      ),
    );
  }

  //full body
  myBody(size) {
    return SingleChildScrollView(
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          // 2
          () => _pagingController.refresh(),
        ),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          padding: EdgeInsets.only(
            left: 10,
            right: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                searchController: searchController,
                isWiritten: false,
                callback: () => _pagingController.refresh(),
              ),
              Container(
                height: 8.0,
              ),
              // searchText(),
              // searchFilters(context),
              //Search Item:
              // medicineItemList(_pagingController, context, isAdmin),
              PagedListView.separated(
                pagingController: _pagingController,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    SizedBox(height: 10.0),
                builderDelegate: PagedChildBuilderDelegate<DrugDetails>(
                  itemBuilder: (context, article, index) {
                    return medicineItem2(_pagingController.itemList, isAdmin,
                        index, context, _pagingController);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//dropdown
// Visibility searchFilters(BuildContext context) {
//   return Visibility(
//     visible: this.isChecked == true ? true : false,
//     child: FadeAnimation(
//       1,
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 8.0),
//             margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
//             height: 38.0,
//             width: MediaQuery.of(context).size.width / 2.3,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 border: Border.all(color: primaryColor, width: 1.5)),
//             child: DropdownButton(
//               underline: SizedBox(),
//               value: this.selectBrand,
//               onChanged: (val) {
//                 setState(() {
//                   this.selectBrand = val;
//                 });
//               },
//               items: thanatlist.map((val) {
//                 return DropdownMenuItem(
//                   value: val,
//                   child: Text(
//                     val,
//                     style: TextStyle(
//                         color: primaryColor, fontWeight: FontWeight.bold),
//                   ),
//                 );
//               }).toList(),
//               icon: Icon(
//                 Icons.arrow_drop_down,
//                 color: primaryColor,
//               ),
//               iconSize: 35.0,
//               hint: Text(
//                 'Brand',
//                 style: TextStyle(
//                     color: primaryColor, fontWeight: FontWeight.bold),
//               ),
//               isExpanded: true,
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(
//               left: 8.0,
//             ),
//             margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
//             height: 38.0,
//             width: MediaQuery.of(context).size.width / 2.3,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 border: Border.all(color: primaryColor, width: 1.5)),
//             child: DropdownButton(
//               underline: SizedBox(),
//               value: this.selectBrand,
//               onChanged: (val) {
//                 setState(() {
//                   this.selectBrand = val;
//                 });
//               },
//               items: thanatlist.map((val) {
//                 return DropdownMenuItem(
//                   value: val,
//                   child: Text(
//                     val,
//                     style: TextStyle(
//                         color: primaryColor, fontWeight: FontWeight.bold),
//                   ),
//                 );
//               }).toList(),
//               icon: Icon(
//                 Icons.arrow_drop_down,
//                 color: primaryColor,
//               ),
//               iconSize: 35.0,
//               hint: Text(
//                 'Brand',
//                 style: TextStyle(
//                     color: primaryColor, fontWeight: FontWeight.bold),
//               ),
//               isExpanded: true,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

//   searchText() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Checkbox(
//           activeColor: primaryLight,
//           value: isChecked,
//           onChanged: (val) {
//             setState(() {
//               isChecked = val;
//             });
//           },
//           checkColor: white,
//         ),
//         sText(
//             "Search by",
//             this.isChecked == true ? primaryColor : Color(0xff626161),
//             16.0,
//             FontWeight.bold)
//       ],
//     );
//   }
}
