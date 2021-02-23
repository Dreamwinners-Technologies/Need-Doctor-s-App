import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/CardNetwork.dart';

import 'Visitingcard_Info.dart';

// ignore: must_be_immutable
class VisitingCardListNew extends StatefulWidget {
  bool isAdmin;

  VisitingCardListNew({this.isAdmin}){
    this.isAdmin = isAdmin;
  }

  @override
  _VisitingCardListNewState createState() => _VisitingCardListNewState(isAdmin);
}

class _VisitingCardListNewState extends State<VisitingCardListNew> {
  final _pagingController = PagingController<int, CardInfoResponseList>(
    // 2
    firstPageKey: 0,
  );

  _VisitingCardListNewState(bool isAdmin){
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

      final newPage = await getCardList(
          pageNo: pageKey,
          pageSize: 30,
          name: name,
          district: district,
          specialization: specialization,
          thana: thana);

      // final newPage = await getCardList(pageNo: pageKey, pageSize: 10);

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

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

  bool isChecked = false;

  bool isAdmin = false;
  TextEditingController searchController = TextEditingController();

  var selectdis, selectthan, selectspeacl;

  String _selectedDistrict, _selectedThana; // Option 2
  int _selectedDistrictId;

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

  CardListResponse cardListResponse;
  String selectSpeciality;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visiting Card List"),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => Future.sync(
            // 2
            () => _pagingController.refresh(),
          ),
          // 3
          child: Container(
            // padding: const EdgeInsets.only(right: 12.0),
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Column(
              children: [
                searchWidget(context),
                searchByCheckBox(),
                searchByVisibility(context),
                Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  margin: EdgeInsets.only(top: 10.0),
                  child: PagedListView.separated(
                    // padding: EdgeInsets.only(
                    //   left: 10.0,right: 10.0
                    // ),
                    // 4
                    pagingController: _pagingController,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    builderDelegate:
                        PagedChildBuilderDelegate<CardInfoResponseList>(
                      itemBuilder: (context, article, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Tapped");
                            print(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisitingCardInformation(
                                    cardInfoResponseList:
                                        _pagingController.itemList[index]),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 3.0,
                            child: Container(
                              padding: EdgeInsets.only(left: 14.0, right: 12.0),
                              margin: EdgeInsets.only(bottom: 5.0),
                              height: MediaQuery.of(context).size.height * .12,
                              width: MediaQuery.of(context).size.width * .9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // cardListResponse.cardInfoResponseList[index].name,
                                        _pagingController.itemList[index].name,
                                        style: TextStyle(
                                            // fontSize: 20,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .021,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        _pagingController
                                            .itemList[index].specialization,
                                        style: TextStyle(
                                            // fontSize: 18,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .019,
                                            color: primaryColor,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        _pagingController
                                            .itemList[index].district,
                                        style: TextStyle(
                                          // fontSize: 16,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .0175,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  visibleUnVisibleWidget(index),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column visibleUnVisibleWidget(int index) {
    if (isAdmin) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                print("Click");
              },
              child: Icon(
                Icons.edit,
                color: primaryLight,
                size: 30,
              )),
          GestureDetector(
              onTap: () {
                String cardId = _pagingController.itemList[index].id;
                print("Click");
                print(index);
                print(cardId);

                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.BOTTOMSLIDE,
                  tittle: 'Are You Sure?',
                  desc: 'You wants to delete this Card?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    MessageIdResponse messageResponse = await deleteCard(cardId: cardId);

                    if(messageResponse!=null){
                      _pagingController.refresh();
                    }
                  },
                )..show();

              },
              child: Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 30,
              ))
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.info,
              size: 30,
              color: primaryColor,
            ),
          )
        ],
      );
    }
  }

  Visibility searchByVisibility(BuildContext context) {
    return Visibility(
      visible: this.isChecked == true ? true : false,
      child: FadeAnimation(
        1,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                districtListDropDown(context),
                thanaListDropDown(context),
              ],
            ),
            specializationContainer(),
          ],
        ),
      ),
    );
  }

  Row searchByCheckBox() {
    return Row(
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
              color: this.isChecked == true ? primaryColor : Color(0xff626161)),
        )
      ],
    );
  }

  Center searchWidget(BuildContext context) {
    return Center(
      child: Container(
        height: 50.0,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        margin: EdgeInsets.only(top: 14.0),
        decoration: BoxDecoration(
            color: Color(0xffF5F3F3),
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            SearchBoxWidget(searchController: searchController),
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
                    onTap: () => _pagingController.refresh(),
                    child: SvgPicture.asset("asset/svg/search_icon.svg")),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.0,
      ),
      margin: EdgeInsets.only(top: 10.0, bottom: 8.0, right: 5),
      height: 38.0,
      width: MediaQuery.of(context).size.width / 1.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        hint: Text(
          'Thana',
          style: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        // Not necessary for Option 1
        value: _selectedThana,
        onChanged: (newValue1) {
          setState(() {
            _selectedThana = newValue1;
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
    );
  }

  Container districtListDropDown(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      margin: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 5),
      height: 38.0,
      width: MediaQuery.of(context).size.width / 2.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        hint: Text(
          'District',
          style: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        // Not necessary for Option 1
        value: _selectedDistrict,
        onChanged: (newValue) {
          setState(() {
            _selectedDistrict = newValue;
            _selectedThana = null;

            for (int i = 0; i < districtList.length; i++) {
              if (districtList[i].name == newValue) {
                _selectedDistrictId = districtList[i].id;
              }
            }
          });
        },
        items: districtList.map((location) {
          return DropdownMenuItem(
            child: new Text(
              location.name,
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 18,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            value: location.name,
          );
        }).toList(),
      ),
    );
  }

  Container specializationContainer() {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      margin: EdgeInsets.only(left: 5.0, bottom: 5.0),
      height: 38.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        underline: SizedBox(),
        hint: Text("Speciality",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        iconSize: 40,
        dropdownColor: Colors.white,
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            this.selectSpeciality = val;
          });
        },
        value: this.selectSpeciality,
        items: specalizationlist.map(
          (val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val,
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 18,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({
    Key key,
    @required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      maxLengthEnforced: false,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xffB2B2B2)),
          hintText: 'Search...',
          border: InputBorder.none,
          labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
    );
  }
}