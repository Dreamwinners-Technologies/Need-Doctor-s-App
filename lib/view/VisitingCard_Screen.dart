import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/StaticData/DistrictListRaw.dart';
import 'package:need_doctors/models/StaticData/DistrictLists.dart';
import 'package:need_doctors/models/StaticData/ThanaListRaw.dart';
import 'package:need_doctors/models/StaticData/ThanaLists.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/Visitingcard_Info.dart';

// ignore: must_be_immutable
class VisitingCardList extends StatefulWidget {
  final bool isAdmin;

  var cardListResponse;

  VisitingCardList({this.isAdmin, this.cardListResponse});

// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
  @override
  _VisitingCardListState createState() =>
      _VisitingCardListState(cardListResponse);
}

class _VisitingCardListState extends State<VisitingCardList> {
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

  String selectSpeciality;
  CardListResponse cardListResponse;

  _VisitingCardListState(CardListResponse cardListResponse) {
    this.cardListResponse = cardListResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryLight,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contex) => AddCardPage()));
        },
        child: Icon(Icons.add, color: white),
      ),
      appBar: AppBar(
        title: Text("Visiting Card List"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 12.0),
          child: Column(
            children: [
              // customSearchWidget(searchController, context,cardListResponse),
              searchWidget(context),
              searchByCheckBox(),
              searchByVisibility(context),
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: cardListResponse.totalItem,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("Tapped");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisitingCardInformation(
                                cardInfoResponseList: cardListResponse
                                    .cardInfoResponseList[index]),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.only(left: 14.0, right: 14.0),
                          margin: EdgeInsets.only(bottom: 5.0),
                          height: MediaQuery.of(context).size.height * .12,
                          width: MediaQuery.of(context).size.width * .9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardListResponse
                                        .cardInfoResponseList[index].name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    cardListResponse.cardInfoResponseList[index]
                                        .specialization,
                                    style: TextStyle(
                                        fontSize: 18, color: primaryColor),
                                  ),
                                  Text(
                                    cardListResponse
                                        .cardInfoResponseList[index].district,
                                    style: TextStyle(
                                        fontSize: 16, color: primaryColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible: isAdmin ? false : true,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: Icon(
                                            Icons.info,
                                            size: 30,
                                            color: primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: isAdmin ? true : false,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                              print("Click");
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.redAccent,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        margin: EdgeInsets.only(left: 12.0, top: 14.0),
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
                    onTap: searchDataBy,
                    child: SvgPicture.asset("asset/svg/search_icon.svg")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchDataBy() async {
    print("search");
    var name = searchController.text;
    var district = _selectedDistrict;
    var thana = _selectedThana;
    var specialization = selectSpeciality;

    print("$name $district $thana $specialization");

    print(1);
    if (name != null) {
      if (name.isEmpty) {
        name = null;
      }
    }
    print(2);
    if (district != null) {
      if (district.isEmpty) {
        district = null;
      }
    }

    print(3);
    if (thana != null) {
      if (thana.isEmpty) {
        thana = null;
      }
    }

    print(4);
    if (specialization != null) {
      if (specialization.isEmpty) {
        specialization = null;
      }
    }

    print(5);
    // CardSearchRequest cardSearchRequest = CardSearchRequest(name: name, specialization: specialization, thana: thana, district: district);
    //
    // CardListResponse cards = await getCardListAdvance(cardSearchRequest: cardSearchRequest);

    CardListResponse cards = await getCardList(
        name: name,
        pageNo: 0,
        pageSize: 100,
        district: district,
        specialization: specialization,
        thana: thana);

    searchController.clear();
    _selectedDistrict = null;
    _selectedThana = null;
    selectSpeciality = null;

    setState(() {
      cardListResponse = cards;
    });
  }

  Container thanaListDropDown(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 8.0,
      ),
      margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
      height: 38.0,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        hint: Text(
          'Thana',
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
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
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            value: location2,
          );
        }).toList(),
      ),
    );
  }

  Container districtListDropDown(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      margin: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 8.0),
      height: 38.0,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: DropdownButton(
        hint: Text(
          'District',
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
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
              style: TextStyle(color: Colors.grey, fontSize: 18),
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
      margin: EdgeInsets.only(left: 12.0, bottom: 8.0),
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
                style: TextStyle(color: Colors.grey, fontSize: 18),
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
