import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/objectbox.g.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/service/store_init.dart';
import 'package:need_doctors/view/medicien_search/utils/item.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

class BrandMedicineList extends StatefulWidget {
  BrandMedicineList({String generic}) {
    this.generic = generic;
  }

  String generic;

  @override
  _BrandMedicineListState createState() => _BrandMedicineListState(generic);
}

class _BrandMedicineListState extends State<BrandMedicineList> {
  _BrandMedicineListState(String generic) {
    this.generic = generic;
  }

  TextEditingController searchCompanyController = TextEditingController();
  String generic;

  final _pagingController = PagingController<int, DrugDetails>(
    // 2
    firstPageKey: 0,
  );

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

      String companyName = searchCompanyController.text;
      print(companyName + " c");

      // NoSQLConfig noSQLConfig = NoSQLConfig();

      print(1);

      BoxStore boxStore = BoxStore();
      print(1);
      var store = await boxStore.getStore();
      print(1);

      // var store = openStore();

      // await noSQLConfig.save50Data(store);
      var box = store.box<DrugDetails>();
      print(1);

      List<DrugDetails> drugDetailsList = [];

      print(1);
      print("search0");

      print(companyName);
      int count;
      if (companyName.length > 1) {
        companyName = companyName.toLowerCase();
        companyName = companyName.substring(0, 1).toUpperCase() + companyName.substring(1);

        print("search1");

        final query = (box.query(DrugDetails_.brandName.startsWith(companyName).and(DrugDetails_.generic.equals(generic)))
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
        final query = (box.query(DrugDetails_.brandName.contains('').and(DrugDetails_.generic.equals(generic)))
              ..order(DrugDetails_.name, flags: Order.caseSensitive))
            .build();

        count = query.count();

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

      // final query = (box.query(DrugDetails_.companyName.contains(""))..order(DrugDetails_.companyName)).build();
      // List<DrugDetails> drugDetailsList = query.find();

      // print(drugDetailsList.length);

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount = _pagingController.itemList?.length ?? 0;

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
      if (error.toString().contains("Cannot create multiple Store instances for the same directory")) {
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
          title: Text("Search By Company"),
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
              topRight: Radius.circular(25.0),
            ),
          ),
          padding: EdgeInsets.only(
            left: 10,
            right: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                searchController: searchCompanyController,
                isWiritten: false,
                callback: () => _pagingController.refresh(),
                searchBoxText: "Company",
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
                      return medicineItem2(_pagingController.itemList, false, index, context, _pagingController);
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
}
