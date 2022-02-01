import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/StaticData/District/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/District/DistrictModel.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionModel.dart';
import 'package:need_doctors/models/StaticData/Division/DivisionRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/Thana/ThanaModel.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/visitingCard/utils/listview.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';
import 'package:need_doctors/view/visitingCard/utils/visibility.dart';

// ignore: must_be_immutable
class VisitingCardListNew extends StatefulWidget {
  bool isAdmin;
  int getlenthsize;

  VisitingCardListNew({this.isAdmin}) {
    this.isAdmin = isAdmin;
  }

  @override
  _VisitingCardListNewState createState() => _VisitingCardListNewState(isAdmin);
}

class _VisitingCardListNewState extends State<VisitingCardListNew> {
  final _pagingController = PagingController<int, CardInfoResponse>(
    // 2
    firstPageKey: 0,
  );

  _VisitingCardListNewState(bool isAdmin) {
    this.isAdmin = isAdmin;
  }

  @override
  void initState() {
    // 3
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      print("search");
      var name = searchController.text;
      var district = _selectedDistrict;
      var thana = _selectedThana;
      var specialization = selectSpeciality;

      if (isChecked == false) {
        specialization = null;
        district = null;
        thana = null;
        _selectedDistrict = null;
        _selectedThana = null;
        selectSpeciality = null;
      }

      if (name != null) {
        if (name.isEmpty) {
          name = null;
        }
      }

      if (district != null) {
        if (district.isEmpty) {
          district = null;
        }
      }

      if (thana != null) {
        if (thana.isEmpty) {
          thana = null;
        }
      }

      if (specialization != null) {
        if (specialization.isEmpty) {
          specialization = null;
        }
      }

      print("$name $district $thana $specialization");

      final newPage =
          await getCardList(pageNo: pageKey, pageSize: 30, name: name, district: district, division: specialization, thana: thana);

      print(newPage.cardInfoResponseList.length);

      // final newPage = await getCardList(pageNo: pageKey, pageSize: 10);

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount = _pagingController.itemList?.length ?? 0;

      final isLastPage = newPage.lastPage;
      final newItems = newPage.cardInfoResponseList;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(newItems);
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

  bool isChecked = true;

  bool isAdmin = false;
  bool isWiritten = false;
  TextEditingController searchController = TextEditingController();

  String getSpeList(List<String> temp) {
    String specializations = "";
    List<String> tempData = temp;
    for (int i = 0; i < tempData.length; i++) {
      specializations += tempData[i];
    }
    return specializations;
  }

  CardListResponse cardListResponse;
  String selectSpeciality;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'doctor',
      child: Scaffold(
          backgroundColor: primarycolor,
          //appbar
          appBar: AppBar(
            backgroundColor: primarycolor,
            elevation: 0.0,
            title: sText("Visiting Card", whitecolor, 20.0, FontWeight.bold),
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
          decoration: BoxDecoration(
              color: whitecolor, borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SearchWidget(
                searchController: searchController,
                isWiritten: isWiritten,
                callback: () => _pagingController.refresh(),
                searchBoxText: "Doctor Name",
              ),
              searchByCheckBox(),
              searchByVisibility(
                  context,
                  this.isChecked,
                  customDropDown(context, _selectedDivision, divisionModelList, onDivisionChange, "Division"),
                  customDropDown(context, _selectedDistrict, districtModels, onDistrictChange, "District"),
                  customDropDown(context, _selectedThana, thanaModels, onThanaChange, "Thana"),
                  specializationContainer),
              DoctorListView(
                isAdmine: isAdmin,
                pagingController: _pagingController,
              )
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
                _pagingController.refresh();
              }
            });
          },
          checkColor: white,
        ),
        sText("Filter by", this.isChecked == true ? primaryColor : blackcolor.withOpacity(0.7), 18.0, FontWeight.bold),
      ],
    );
  }

  String _selectedDivision, _selectedDistrict, _selectedThana;

  List<DivisionModel> divisionModelList = divisionListJsonFromJson(jsonEncode(divisionListJson));
  List<DistrictModel> districtModelList = districtModelsFromJson(jsonEncode(districtListJson));
  List<ThanaModel> thanaModelList = thanaListsFromJson(jsonEncode(thanaListJson));

  List<ThanaModel> thanaModels = [];
  List<DistrictModel> districtModels = [];

  customDropDown(BuildContext context, _selectedData, List<dynamic> itemList, onChangeMethod, String hintText) {
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
          hint: sText(hintText, greylightColor, 16.0, FontWeight.w500),
          // Not necessary for Option 1
          value: _selectedData,
          onChanged: onChangeMethod,
          items: itemList.map((item) {
            return DropdownMenuItem(
              value: item.name,
              child: Text(
                item.name,
                style: TextStyle(
                  color: Colors.black, //Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                ),
                overflow: TextOverflow.clip,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void onDivisionChange(dropDownValue) {
    print(dropDownValue);
    setState(() {
      _selectedDivision = dropDownValue;
      _selectedDistrict = null;
      _selectedThana = null;

      String divisionName = dropDownValue;
      DivisionModel division = new DivisionModel();

      divisionModelList.forEach((element) {
        if (element.name == divisionName) {
          division = element;
        }
      });

      districtModels = [];
      districtModelList.forEach((element) {
        if (element.divisionId == division.id) {
          districtModels.add(element);
        }
      });
    });
  }

  void onThanaChange(dropDownValue) {
    setState(() {
      print(dropDownValue);
      _selectedThana = dropDownValue;
      if (_selectedThana != null) {
        //  _pagingController.refresh();
      }
      _pagingController.refresh();
    });
  }

  void onDistrictChange(dropDownValue) {
    setState(() {
      _selectedDistrict = dropDownValue;
      _selectedThana = null;

      String districtName = dropDownValue;
      DistrictModel district = new DistrictModel();
      districtModelList.forEach((element) {
        if (element.name == districtName) {
          district = element;
        }
      });

      thanaModels = [];

      thanaModelList.forEach((element) {
        if (element.districtId == district.id) {
          thanaModels.add(element);
        }
      });
      _pagingController.refresh();
    });
  }

  specializationContainer() {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 7),
      height: 42.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        iconSize: 40.0,
        underline: SizedBox(),
        isExpanded: true,
        hint: sText('Speciality', greylightColor, 16.0, FontWeight.w500),
        // iconSize: 40,
        // dropdownColor: Colors.white,
        onChanged: (val) {
          setState(() {
            this.selectSpeciality = val;

            if (val != null) {
              _pagingController.refresh();
            }
          });
        },
        value: this.selectSpeciality,
        items: specializationList.map(
          (val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val,
                style: TextStyle(
                  color: primaryColor,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
