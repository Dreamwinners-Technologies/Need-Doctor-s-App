import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Text(cardInfoResponseList.name),
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
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(top: 1.0),
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 6.0, bottom: 6.0),
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
                      textset(
                          context, cardInfoResponseList.name, Icons.person_pin),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _dialtocall(
                                  'tel:${cardInfoResponseList.appointmentNo}');
                            });
                          },
                          child: phonetextset(context,
                              cardInfoResponseList.appointmentNo, Icons.phone)),
                      textset(context, cardInfoResponseList.specialization,
                          Icons.work_outline),
                      textset(context, cardInfoResponseList.district,
                          Icons.location_on_rounded),
                      textset(context, cardInfoResponseList.thana,
                          Icons.location_on_outlined),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 6.0, bottom: 6.0, right: 6.0),
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

Widget textset(BuildContext context, String title, IconData iconData) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, bottom: 5, left: 8.0, right: 2.0),
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
            // height: 25.0,
            // width: 20.0,
            // child: SvgPicture.asset(svg),
            child: Icon(
              iconData,
              color: primaryColor,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * .0175,
            ),
          ),
        )
      ],
    ),
  );
}

Widget phonetextset(BuildContext context, String title, IconData iconData) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, bottom: 5, left: 8.0, right: 2.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))),
    child: Stack(
      children: [
        Positioned(
            right: 8.0,
            bottom: 3.0,
            child: Material(
              child: InkWell(
                child: Container(
                  width: 45.0,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text("Call",
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))),
                ),
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 3.0),
                // height: 25.0,
                // width: 20.0,
                // child: SvgPicture.asset(svg),
                child: Icon(
                  iconData,
                  color: primaryColor,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * .0175,
                ),
              ),
            ),
          ],
        ),
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

_dialtocall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
