import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/objectbox.g.dart';
// import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/service/store_init.dart';
import 'package:need_doctors/view/medicien_search/utils/item.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

// ignore: must_be_immutable
class SearchMedicineNewNoSQL extends StatefulWidget {
  SearchMedicineNewNoSQL(bool isAdmin) {
    this.isAdmin = isAdmin;
  }

  bool isAdmin;
  String generic;

  @override
  _SearchMedicineNewNoSQLState createState() =>
      _SearchMedicineNewNoSQLState(isAdmin);
}

class _SearchMedicineNewNoSQLState extends State<SearchMedicineNewNoSQL> {
  //Checkbox
  bool isChecked = false;
  TextEditingController searchController = TextEditingController();
  var selectBrand, selectGeneric;

  _SearchMedicineNewNoSQLState(bool isAdmin) {
    this.isAdmin = isAdmin;
  }

  final _pagingController = PagingController<int, DrugDetails>(
    // 2
    firstPageKey: 0,
  );

  bool isAdmin = true;

  @override
  initState() {
    // 3

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      print("search");

      String name = searchController.text;
      print(name + " c");

      // NoSQLConfig noSQLConfig = NoSQLConfig();

      print(1);

      BoxStore boxStore = BoxStore();
      print(1);
      var store = await boxStore.getMedicineStore();
      print(1);

      // var store = openStore();

      // await noSQLConfig.save50Data(store);
      var box = store.box<DrugDetails>();
      print(1);

      List<DrugDetails> drugDetailsList = [];

      print(1);
      print("search0");

      int count;
      if (name.length > 1) {
        print("search1");

        final query =
            (box.query(DrugDetails_.name.startsWith(name.toUpperCase()))
                  ..order(DrugDetails_.name, flags: Order.caseSensitive))
                .build();

        count = query.count();

        query
          ..limit = 10
          ..offset = (pageKey * 10);

        drugDetailsList = query.find();

        query.close();
        // store.close();

        // ..limit(10)..offset((pageKey * 10));
        // count = box.;

      } else {
        print("search3");
        // final query = (box.query(DrugDetails_.name.contains('').and(DrugDetails_.generic.contains(generic)))
        //       ..order(DrugDetails_.name, flags: Order.caseSensitive))
        //     .build();

        final query = (box.query(DrugDetails_.name.contains(''))
              ..order(DrugDetails_.name, flags: Order.caseSensitive))
            .build();

        count = query.count();

        print(count);

        query
          ..limit = 10
          ..offset = (pageKey * 10);

        drugDetailsList = query.find();

        query.close();
        // store.close();
      }

      bool isLastPage;
      if (pageKey * 10 >= count) {
        isLastPage = true;
      } else {
        isLastPage = false;
      }

      // List<DrugDetails> drugDetailsList = box.values.toList();
      // List<DrugDetails> drugDetailsList = box.getAll();

      // final query = (box.query(DrugDetails_.name.contains(""))..order(DrugDetails_.name)).build();
      // List<DrugDetails> drugDetailsList = query.find();

      // print(drugDetailsList.length);

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      // final isLastPage = newPage.lastPage;
      // final newItems = newPage.drugModelList;

      // bool isLastPage = true;

      final newItems = drugDetailsList;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(drugDetailsList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
      //store.close();
    } catch (error) {
      if (error.toString().contains(
          "Cannot create multiple Store instances for the same directory")) {
        sendToast('Data Sync in Process.Please Wait.');
      }
      print(error);
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
                searchBoxText: "Medicine",
              ),
              Container(
                height: 8.0,
              ),
              // searchText(),
              // searchFilters(context),
              //Search Item:
              // medicineItemList(_pagingController, context, isAdmin),
              Expanded(
                child: PagedListView.separated(
                  pagingController: _pagingController,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  builderDelegate: PagedChildBuilderDelegate<DrugDetails>(
                    itemBuilder: (context, article, index) {
                      return medicineItem2(_pagingController.itemList, isAdmin,
                          index, context, _pagingController);
                    },
                  ),
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
