import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';

class VisitingCardInformation extends StatefulWidget {
  VisitingCardInformation({CardInfoResponseList cardInfoResponseList}) {
    this.cardInfoResponseList = cardInfoResponseList;
  }

  CardInfoResponseList cardInfoResponseList;

  @override
  _VisitingCardInformationState createState() =>
      _VisitingCardInformationState(cardInfoResponseList);
}

class _VisitingCardInformationState extends State<VisitingCardInformation> {
  _VisitingCardInformationState(CardInfoResponseList cardInfoResponseList) {
    this.cardInfoResponseList = cardInfoResponseList;

    if (this.cardInfoResponseList.cardOcrData == null) {
      this.cardInfoResponseList.cardOcrData = "No Data";
    }
  }

  CardInfoResponseList cardInfoResponseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Information"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(7.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(cardInfoResponseList.cardImageUrl),
                      ),
                    );
                  },
                  child: images(
                      context: context,
                      imgUrl: cardInfoResponseList.cardImageUrl)),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 3.0),
                child: Text(
                  "Information",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              textset(context, cardInfoResponseList.name,
                  "asset/svg/account_icon.svg"),
              textset(context, cardInfoResponseList.specialization,
                  "asset/svg/organization_icon.svg"),
              textset(context, cardInfoResponseList.district,
                  "asset/svg/address_icon.svg"),
              textset(context, cardInfoResponseList.thana,
                  "asset/svg/address_icon.svg"),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 3.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top:4.0,left: 8.0,right: 8.0,bottom: 4.0),
                      child: Text(
                          cardInfoResponseList.cardOcrData,
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget images({BuildContext context, String imgUrl}) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            imgUrl,
            fit: BoxFit.contain,
          )));
}

Widget textset(BuildContext context, String title, String svg) {
  return Container(
    margin: const EdgeInsets.only(top: 8.0),
    width: MediaQuery.of(context).size.width
    ,
    // height: 40.0,
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 3.0),
          height: 30.0,
          width: 25.0,
          child: SvgPicture.asset(svg),
        ),
        Text(
          title,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * .022,
          ),
        )
      ],
    ),
  );
}

class DetailScreen extends StatelessWidget {
  DetailScreen(String cardImageUrl) {
    this.cardImageUrl = cardImageUrl;
  }

  String cardImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              cardImageUrl,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
