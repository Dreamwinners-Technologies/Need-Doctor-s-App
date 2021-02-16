import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/items/objectdata.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/view/AddCard.dart';
import 'package:need_doctors/view/Visitingcard_Info.dart';

// ignore: must_be_immutable
class VisitingCardList extends StatefulWidget {
// <<<<<<< HEAD
//   CardListResponse cardListResponse;
//
//   VisitingCardList(CardListResponse cardListResponse) {
//     this.cardListResponse = cardListResponse;
//   }
//
// =======
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
  TextEditingController searchController = TextEditingController();

  //selecteditem:
  var selectdis, selectthan, selectspeacl;

  var selectSpeciality;
  CardListResponse cardListResponse;

  // CardInfoResponseList cardInfoResponseList = cardInfoResponseList

  _VisitingCardListState(CardListResponse cardListResponse) {
    this.cardListResponse = cardListResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// <<<<<<< HEAD
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryLight,
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => AddCardPage()));
//         },
//         child: Icon(Icons.add, color: white),
//       ),
//       appBar: AppBar(
//         title: Text("Visiting Card List"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(6.0),
//         child: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           itemCount: cardListResponse.totalItem,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 print("Done");
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         VisitingCardInfo(cardListResponse.cardInfoResponseList[index]),
//                   ),
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: primaryColor,
//                 ),
//                 padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                 margin: EdgeInsets.only(bottom: 5.0),
//                 height: 90,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           cardListResponse.cardInfoResponseList[index].name,
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           cardListResponse
//                               .cardInfoResponseList[index].specialization,
//                           style: TextStyle(fontSize: 18, color: white),
//                         ),
//                         Text(
//                           cardListResponse.cardInfoResponseList[index].district,
//                           style: TextStyle(fontSize: 15, color: white),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Checkbox(
//                           value: isChecked,
//                           onChanged: (val) {
//                             setState(() {
//                               isChecked = val;
//                             });
//                           },
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             print("Click");
//                           },
//                           child: Icon(
//                             Icons.delete,
//                             color: white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
// =======
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
                customsearchWidget(searchController, context),
                Row(
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
                          color: this.isChecked == true
                              ? primaryColor
                              : Color(0xff626161)),
                    )
                  ],
                ),
                Visibility(
                  visible: this.isChecked == true ? true : false,
                  child: FadeAnimation(
                    1,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8.0),
                              margin: EdgeInsets.only(
                                  left: 12.0, top: 10.0, bottom: 8.0),
                              height: 38.0,
                              width: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: primaryColor, width: 1.5)),
                              child: DropdownButton(
                                underline: SizedBox(),
                                value: this.selectdis,
                                onChanged: (val) {
                                  setState(() {
                                    this.selectdis = val;
                                  });
                                },
                                items: thanatlist.map((val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(
                                      val,
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: primaryColor,
                                ),
                                iconSize: 35.0,
                                hint: Text(
                                  'District',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
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
                                  border: Border.all(
                                      color: primaryColor, width: 1.5)),
                              child: DropdownButton(
                                underline: SizedBox(),
                                value: this.selectthan,
                                onChanged: (val) {
                                  setState(() {
                                    this.selectthan = val;
                                  });
                                },
                                items: thanatlist.map((val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Text(
                                      val,
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: primaryColor,
                                ),
                                iconSize: 35.0,
                                hint: Text(
                                  'Thana',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                isExpanded: true,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          margin: EdgeInsets.only(left: 12.0, bottom: 8.0),
                          height: 38.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: primaryColor, width: 1.5)),
                          child: DropdownButton(
                            underline: SizedBox(),
                            value: this.selectspeacl,
                            onChanged: (val) {
                              setState(() {
                                this.selectspeacl = val;
                              });
                            },
                            items: specalizationlist.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: primaryColor,
                            ),
                            iconSize: 35.0,
                            hint: Text(
                              'Specality',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                              builder: (context) =>  VisitingCardInformation(
                                  cardInfoResponseList:
                                  cardListResponse.cardInfoResponseList[index]),
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
                            height: 100,
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
                                      cardListResponse
                                          .cardInfoResponseList[index]
                                          .specialization,
                                      style: TextStyle(
                                          fontSize: 18, color: primaryColor),
                                    ),
                                    Text(
                                      cardListResponse
                                          .cardInfoResponseList[index].district,
                                      style: TextStyle(
                                          fontSize: 15, color: primaryColor),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: widget.isAdmin ? true : false,
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
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            print("Click");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                          ))
                                    ],
                                  ),
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
        ));
// >>>>>>> 51b7078c5f7d1816c5f7f8bb08e0885dc7d9c579
  }
}


