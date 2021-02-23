import 'package:cached_network_image/cached_network_image.dart';
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
      body: Container(
        color: Colors.grey[200],
        // padding: const EdgeInsets.all(7.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      child: images(
                          context: context,
                          imgUrl: cardInfoResponseList.cardImageUrl),
                    ),
                  )),
              Card(
                elevation: 5.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 1.0),
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 6.0, bottom: 6.0),
                      color: primaryColor,
                      width: double.infinity,
                      child: Text(
                        "Basic Info",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: white),
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
                  ],
                ),
              ),
              Card(
                elevation: 5.0,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 5.0, top: 6.0, bottom: 6.0, right: 6.0),
                        color: primaryColor,
                        width: double.infinity,
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
                        child: SingleChildScrollView(
                          child: Text(
                            cardInfoResponseList.cardOcrData,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
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
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        progressIndicatorBuilder: (context, imgUrl, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, imgUrl, error) => Column(
          children: [Icon(Icons.error), Text(error.toString())],
        ),
        fit: BoxFit.contain,
      ),
      // child: Image.network(
      //   imgUrl,
      //   fit: BoxFit.contain,
      // ),
    ),
  );
}

Widget textset(BuildContext context, String title, String svg) {
  return Container(
    margin: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
    width: MediaQuery.of(context).size.width,
    // height: 40.0,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 3.0),
          height: 25.0,
          width: 20.0,
          child: SvgPicture.asset(svg),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * .018,
            ),
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
