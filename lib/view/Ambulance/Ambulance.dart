// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/StaticData/AmbulanceModel.dart';
import 'package:need_doctors/models/StaticData/AmbulanceRaw.dart';
import 'package:need_doctors/models/StaticData/District/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/District/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionModel.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaLists.dart';
import 'package:need_doctors/objectbox.g.dart';
import 'package:need_doctors/service/list_of_ambulance.dart';
import 'package:need_doctors/service/store_init.dart';
import 'package:need_doctors/view/Ambulance/widgets/AmobulanceCard.dart';

// ignore: must_be_immutable
class Ambulance extends StatefulWidget {
  bool isAdmin;
  int getlenthsize;

  Ambulance({this.isAdmin}) {
    this.isAdmin = isAdmin;
  }

  @override
  _AmbulanceState createState() => _AmbulanceState(isAdmin);
}

class _AmbulanceState extends State<Ambulance> {
  final _pagingController = PagingController<int, ListOfAmbulance>(
    // 2
    firstPageKey: 0,
  );

  _AmbulanceState(bool isAdmin) {
    this.isAdmin = isAdmin;
    List<AmbulanceModel> ambulances =
        ambulanceListFromJson(jsonEncode(ambulanceList));

    print(ambulances.length);
    this.ambulances = ambulances;
    print(0);
    print(this.ambulances.length);
  }

  List<AmbulanceModel> ambulances = [];

  @override
  void initState() {
    // 3
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  List<ListOfAmbulance> ambulanceListOffline = [];
  int count;
  Future<void> _fetchPage(int pageKey) async {
    try {
      print("search");

      String name = searchController.text;
      print(name + " name");

      // NoSQLConfig noSQLConfig = NoSQLConfig();

      print(1);

      BoxStoreAmbulance boxStore = BoxStoreAmbulance();
      print(1);
      var store = await boxStore.getAmbulanceStore();
      print(1);

      // var store = openStore();

      // await noSQLConfig.save50Data(store);
      var box = store.box<ListOfAmbulance>();
      print(1);

      print(1);
      print("Choose Searching");
      var query;

      print("Normal and Selection Search");
      // final query = (box.query(DrugDetails_.name.contains('').and(DrugDetails_.generic.contains(generic)))
      //       ..order(DrugDetails_.name, flags: Order.caseSensitive))
      //     .build();

      print(_selectedDistrict);

      print(_selectedDivision);
      print('thana:$_selectedThana');

      // print(selectdis + 'District');

      query = (box.query(ListOfAmbulance_.driverName.contains(''))
            ..order(ListOfAmbulance_.driverName, flags: Order.caseSensitive))
          .build();

      //call selection query
      doSelectionQuery(query, box, pageKey);

      // store.close();

      bool isLastPage;
      if (pageKey * 10 >= count) {
        isLastPage = true;
      } else {
        isLastPage = false;
      }

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      // final isLastPage = newPage.lastPage;
      // final newItems = newPage.drugModelList;

      // bool isLastPage = true;

      final newItems = ambulanceListOffline;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(ambulanceListOffline);
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

  void doSelectionQuery(var query, var box, var pageKey) {
    if (isChecked == true) {
      // Bogura - বগুড়া

      if (_selectedDivision != null) {
        print('Yes Contain');
        query = (box
                .query(ListOfAmbulance_.division.contains(_selectedDivision))
              ..order(ListOfAmbulance_.division, flags: Order.caseSensitive))
            .build();
      }

      if (_selectedDistrict != null) {
        print('Yes Contain');
        query = (box
                .query(ListOfAmbulance_.district.contains(_selectedDistrict))
              ..order(ListOfAmbulance_.district, flags: Order.caseSensitive))
            .build();
      }

      if (_selectedThana != null) {
        print('Yes Contain');
        query = (box.query(ListOfAmbulance_.upazila.endsWith(_selectedThana))
              ..order(ListOfAmbulance_.upazila, flags: Order.caseSensitive))
            .build();

        // if (query.count() == 0) {
        //   if (_selectedDivision != null) {
        //     print('Yes Contain');
        //     query = (box.query(
        //             ListOfAmbulance_.driverName.contains(_selectedDivision))
        //           ..order(ListOfAmbulance_.driverName,
        //               flags: Order.caseSensitive))
        //         .build();
        //   }
        // }
      }

      // _pagingController.refresh();
    }

    count = query.count();

    print(count);

    query
      ..limit = 10
      ..offset = (pageKey * 10);

    ambulanceListOffline = query.find();

    query.close();
  }

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }

  bool isChecked = true;

  bool isAdmin = false;
  bool isWiritten = false;
  TextEditingController searchController = TextEditingController();

  var selectdivision, selectdis, selectthan;

  String _selectedDivision, _selectedDistrict, _selectedThana; // Option 2
  int _selectedDistrictId;
  int _selectedDivisionId;

  List<DivisionLists> divisionList =
      divisionListJsonFromJson(jsonEncode(divisionListJson));

  List<DistrictLists> districtList =
      districtListsFromJson(jsonEncode(districtListJson));
  List<ThanaLists> thanaList = thanaListsFromJson(jsonEncode(thanaListJson));

  List<String> getThana(int id) {
    List<String> thanaS = [];
    for (int i = 0; i < thanaList.length; i++) {
      if (thanaList[i].districtId == id) {
        if (thanaList[i].name.isEmpty) {
          continue;
        }
        thanaS.add(thanaList[i].name);
      }
    }

    return thanaS;
  }

  List<String> getDistrict(int id) {
    List<String> disS = [];
    for (int i = 0; i < districtList.length; i++) {
      if (districtList[i].id == id) {
        if (districtList[i].name.isEmpty) {
          continue;
        }
        disS.add(districtList[i].name);
      }
    }

    return disS;
  }

  CardListResponse cardListResponse;
  // String _selectDivision;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ambulance',
      child: Scaffold(
          backgroundColor: primarycolor,
          //appbar
          appBar: AppBar(
            backgroundColor: primarycolor,
            elevation: 0.0,
            title: sText("Ambulance List", whitecolor, 20.0, FontWeight.bold),
            actions: [
              IconButton(
                  padding: EdgeInsets.only(right: 5.0),
                  onPressed: () {
                    setState(() {
                      _selectedDivision = null;
                      _selectedDistrict = null;
                      _selectedThana = null;
                      _selectedDistrictId = null;
                      _selectedDistrictId = null;
                    });

                    _pagingController.refresh();
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 28.0,
                    color: Colors.white,
                  ))
            ],
          ),
          body: mybody()),
    );
  }

//View Body
  mybody() {
    return SingleChildScrollView(
      //refresh
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          // 2
          () => _pagingController.refresh(),
        ),
        //body
        child: Container(
          padding: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // SearchWidget(
              //   searchController: searchController,
              //   isWiritten: isWiritten,
              //   callback: () => _pagingController.refresh(),
              //   searchBoxText: "Ambulance",
              // ),
              // searchByCheckBox(),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  child: Row(
                    children: [
                      divisionListDropDown(context),
                      districtListDropDown(context),
                      thanaListDropDown(context)
                    ],
                  )),
              Expanded(
                  child: PagedListView.separated(
                pagingController: _pagingController,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(height: 10.0),
                builderDelegate: PagedChildBuilderDelegate<ListOfAmbulance>(
                  itemBuilder: (context, article, index) {
                    return AmbulanceCard(_pagingController.itemList[index]);
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  searchByCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          focusColor: whitecolor,
          activeColor: primaryColor,
          value: isChecked,
          onChanged: (val) {
            setState(() {
              isChecked = val;
              if (isChecked == false) {
                _selectedDivision = null;
                _selectedDistrict = null;
                _selectedThana = null;
                _selectedDistrictId = null;
                _selectedDistrictId = null;

                _pagingController.refresh();
              }
            });
          },
          checkColor: white,
        ),
        sText(
            "Filter by",
            this.isChecked == true ? primaryColor : blackcolor.withOpacity(0.7),
            18.0,
            FontWeight.bold),
      ],
    );
  }

  divisionListDropDown(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 5),
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          iconSize: 40.0,
          underline: SizedBox(),
          hint: sText('Division', greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedDivision,
          onChanged: (newValue1) {
            setState(() {
              _selectedDivision = newValue1;
              // _selectedDistrict = null;
              if (newValue1 != null) {
                _pagingController.refresh();
              }

              for (int i = 0; i < divisionList.length; i++) {
                if (divisionList[i].name == newValue1) {
                  _selectedDivisionId = divisionList[i].id;
                }
              }
            });
          },
          items: divisionList.map((location) {
            return DropdownMenuItem(
              value: location.name,
              child: Text(
                location.name,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  thanaListDropDown(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 5.0,
        ),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, right: 5),
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          underline: SizedBox(),
          iconSize: 40,
          hint: sText('Thana', greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedThana,
          onChanged: (newValue2) {
            setState(() {
              print(newValue2);
              _selectedThana = newValue2;
              if (_selectedThana != null) {
                _pagingController.refresh();
              }
            });
          },
          items: getThana(_selectedDistrictId).map((location2) {
            return DropdownMenuItem(
              child: Text(
                location2,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              value: location2,
            );
          }).toList(),
        ),
      ),
    );
  }

  districtListDropDown(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 8.0, right: 5, left: 5),
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor, width: 1.5),
        ),
        child: DropdownButton(
          isExpanded: true,
          iconSize: 40.0,
          underline: SizedBox(),
          hint: sText('District', greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedDistrict,
          onChanged: (newValue3) {
            setState(() {
              _selectedDistrict = newValue3;
              _selectedThana = null;
              if (newValue3 != null) {
                _pagingController.refresh();
              }

              for (int i = 0; i < districtList.length; i++) {
                if (districtList[i].name == newValue3) {
                  _selectedDistrictId = districtList[i].id;
                }
              }
            });
          },
          items: districtList.map((location) {
            return DropdownMenuItem(
              value: location.name,
              child: Text(
                location.name,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
