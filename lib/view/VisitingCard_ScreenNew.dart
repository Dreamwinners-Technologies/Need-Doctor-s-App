import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

import 'EditCard.dart';
import 'Visitingcard_Info.dart';

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
  final _pagingController = PagingController<int, CardInfoResponseList>(
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.3,
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: PagedListView.separated(
                    pagingController: _pagingController,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5.0,
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
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 4.0,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 3.0,
                                  right: 3.0,
                                  bottom: 12.0,
                                  top: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          child: Text(
                                            _pagingController
                                                .itemList[index].name,
                                            style: TextStyle(
                                                fontSize: 19.0,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Text(
                                              _pagingController.itemList[index]
                                                  .specialization,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black)),
                                        ),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 6.0),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.38,
                                                  height: 30.0,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 7),
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Text(
                                                    _pagingController
                                                        .itemList[index].thana,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                        TextStyle(color: white),
                                                    strutStyle: StrutStyle(
                                                        fontSize: 12.0),
                                                  ),
                                                ),
                                                SizedBox(width: 7.0),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 30.0,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 7),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green[700],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Text(
                                                    _pagingController
                                                        .itemList[index]
                                                        .district,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                        TextStyle(color: white),
                                                    strutStyle: StrutStyle(
                                                        fontSize: 12.0),
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  visibleUnVisibleWidget(index)
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
              String cardId = _pagingController.itemList[index].id;

              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditCardPage(_pagingController.itemList[index])))
                  .then((value) => _pagingController.refresh());
              // _pagingController.refresh();
            },
            child: Icon(
              Icons.edit,
              color: primaryLight,
              size: 30,
            ),
          ),
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
                    MessageIdResponse messageResponse =
                        await deleteCard(cardId: cardId);

                    if (messageResponse != null) {
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
          Icon(
            Icons.info,
            size: 30,
            color: primaryColor,
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
        isExpanded: true,
        hint: Text(
          'Thana',
          style: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.019,
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
        isExpanded: true,
        hint: Text(
          'District',
          style: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.019,
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
    );
  }

  Container specializationContainer() {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      margin: EdgeInsets.only(top: 5.0, bottom: 8.0, left: 5),
      height: 38.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        // underline: SizedBox(),
        isExpanded: true,
        hint: Text(
          "Speciality",
          style: TextStyle(
            color: primaryColor,
            fontSize: MediaQuery.of(context).size.height * 0.019,
          ),
        ),
        // iconSize: 40,
        // dropdownColor: Colors.white,
        onChanged: (val) {
          setState(() {
            this.selectSpeciality = val;
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
      // ignore: deprecated_member_use
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
