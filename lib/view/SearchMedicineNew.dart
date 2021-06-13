import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:need_doctors/view/EditCard.dart';
import 'package:need_doctors/view/EditMedicine.dart';

import 'Drag_Details.dart';
//

// ignore: must_be_immutable
class SearchMedicineNew extends StatefulWidget {
  SearchMedicineNew(bool isAdmin, {String generic}) {
    this.isAdmin = isAdmin;
    this.generic = generic;
  }

  bool isAdmin;
  String generic;

  @override
  _SearchMedicineNewState createState() =>
      _SearchMedicineNewState(isAdmin, generic: generic);
}

class _SearchMedicineNewState extends State<SearchMedicineNew> {
  //Checkbox
  bool isChecked = false;
  TextEditingController searchController = TextEditingController();
  var selectBrand, selectGeneric;

  _SearchMedicineNewState(bool isAdmin, {String generic}) {
    this.isAdmin = isAdmin;
    this.generic = generic;
  }

  final _pagingController = PagingController<int, DrugModelList>(
    // 2
    firstPageKey: 0,
  );

  bool isAdmin = true;
  String generic;

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
      String name = searchController.text;
      print(name);
      final newPage = await getDrugList(
          name: name, pageNo: pageKey, pageSize: 25, generic: generic);

      // final newPage = await getCardList(pageNo: pageKey, pageSize: 10);

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      final isLastPage = newPage.lastPage;
      final newItems = newPage.drugModelList;

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

  String getsvg = "asset/svg/search_icon.svg";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Text("Medicines"),
      ),
      body: SingleChildScrollView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // customSearchWidget(
                //     title: "Search...",
                //     controller: searchController,
                //     context: context,
                //     callback: () => _pagingController.refresh()),
                searchText(),
                searchFilters(context),
                //Search Item:
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: PagedListView.separated(
                      padding: EdgeInsets.only(left: 4, right: 4.0),
                      pagingController: _pagingController,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      builderDelegate: PagedChildBuilderDelegate<DrugModelList>(
                        itemBuilder: (context, article, index) {
                          return medicineItem(
                              _pagingController.itemList, index, context);
                        },
                      ),
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

  Visibility searchFilters(BuildContext context) {
    return Visibility(
      visible: this.isChecked == true ? true : false,
      child: FadeAnimation(
        1,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8.0),
              margin: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 8.0),
              height: 38.0,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: primaryColor, width: 1.5)),
              child: DropdownButton(
                underline: SizedBox(),
                value: this.selectBrand,
                onChanged: (val) {
                  setState(() {
                    this.selectBrand = val;

                    _pagingController.refresh();
                  });
                },
                items: thanatlist.map((val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: primaryColor,
                ),
                iconSize: 35.0,
                hint: Text(
                  'Brand',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                isExpanded: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
              height: 38.0,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: primaryColor, width: 1.5)),
              child: DropdownButton(
                underline: SizedBox(),
                value: this.selectBrand,
                onChanged: (val) {
                  setState(() {
                    this.selectBrand = val;

                    _pagingController.refresh();
                  });
                },
                items: thanatlist.map((val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: primaryColor,
                ),
                iconSize: 35.0,
                hint: Text(
                  'Brand',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                isExpanded: true,
              ),
            )
          ],
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditMedicine(_pagingController.itemList[index])));
              },
              child: Icon(
                Icons.edit,
                color: primaryLight,
                size: 30,
              )),
          GestureDetector(
              onTap: () async {
                String drugId = _pagingController.itemList[index].drugId;
                print("Click");
                print(index);
                print(drugId);

                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.BOTTOMSLIDE,
                  tittle: 'Are You Sure?',
                  desc: 'You wants to delete this drug?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    MessageResponseModel messageResponse =
                        await deleteDrug(drugId: drugId);

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

  medicineItem(
      List<DrugModelList> drugModelList, int index, BuildContext context) {
    String medicineType;
    if (drugModelList[index].type == "Tablet" ||
        drugModelList[index].type == "Rapid Tablet") {
      medicineType = "asset/svg/types/tablet.svg";
    } else if (drugModelList[index].type == "Capsule") {
      medicineType = "asset/svg/types/capsule.svg";
    } else if (drugModelList[index].type == "Suspension") {
      medicineType = "asset/svg/types/suspension.svg";
    } else if (drugModelList[index].type == "Suppository") {
      medicineType = "asset/svg/types/suppository.svg";
    } else if (drugModelList[index].type == "IV Infusion" ||
        drugModelList[index].type == "Infusion") {
      medicineType = "asset/svg/types/infusion.svg";
    } else if (drugModelList[index].type == "Cream") {
      medicineType = "asset/svg/types/cream.svg";
    } else if (drugModelList[index].type == "Drop") {
      medicineType = "asset/svg/types/drop.svg";
    } else if (drugModelList[index].type == "Syrup") {
      medicineType = "asset/svg/types/syrup.svg";
    } else {
      medicineType = "asset/svg/types/tablet.svg";
    }

    return GestureDetector(
      onTap: () {
        print(index);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DragDetails(drugModelList[index], medicineType)));
      },
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: drugModelList[index].drugId,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 15.0),
                      width: 60.0,
                      height: 60.0,
                      child: SvgPicture.asset(
                        medicineType,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                              text: drugModelList[index].name,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${drugModelList[index].packSize}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red,
                                    ))
                              ]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          drugModelList[index].generic,
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff464646)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        drugModelList[index].type,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff464646)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          drugModelList[index].brandName,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              visibleUnVisibleWidget(index),
            ],
          ),
        ),
      ),
    );
  }

  Row searchText() {
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
}
