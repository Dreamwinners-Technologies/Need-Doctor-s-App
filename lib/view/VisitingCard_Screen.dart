import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/item/objectdata.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/view/AddCard.dart';

class VisitingCardList extends StatefulWidget {
  CardListResponse cardListResponse;

  VisitingCardList(CardListResponse cardListResponse) {
    this.cardListResponse = cardListResponse;
  }

  @override
  _VisitingCardListState createState() => _VisitingCardListState(cardListResponse);
}

class _VisitingCardListState extends State<VisitingCardList> {
  bool isChecked = false;

  var selectSpeciality;
  CardListResponse cardListResponse;

  // CardInfoResponseList cardInfoResponseList = cardInfoResponseList

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
              context, MaterialPageRoute(builder: (context) => AddCardPage()));
        },
        child: Icon(Icons.add, color: white),
      ),
      appBar: AppBar(
        title: Text("Visiting Card List"),
      ),
      body: Container(
        padding: EdgeInsets.all(6.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: cardListResponse.totalItem,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: primaryColor,
              ),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              margin: EdgeInsets.only(bottom: 5.0),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardListResponse.cardInfoResponseList[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cardListResponse.cardInfoResponseList[index].specialization,
                        style: TextStyle(fontSize: 18, color: white),
                      ),
                      Text(
                        cardListResponse.cardInfoResponseList[index].district,
                        style: TextStyle(fontSize: 15, color: white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Click");
                        },
                        child: Icon(
                          Icons.delete,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }


}
