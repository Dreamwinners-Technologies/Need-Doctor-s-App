import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';

class VisitingCardInfo extends StatelessWidget {
  VisitingCardInfo(CardInfoResponseList cardInfoResponseList) {
    this.cardInfoResponseList = cardInfoResponseList;
  }

  CardInfoResponseList cardInfoResponseList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            child: Image.network(cardInfoResponseList.cardImageUrl),
          ),
          Text(
            cardInfoResponseList.name,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            cardInfoResponseList.specialization,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            cardInfoResponseList.district,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

class VisitingCardDetails extends StatefulWidget {
  VisitingCardDetails(CardInfoResponseList cardInfoResponseList);

  @override
  _VisitingCardDetailsState createState() => _VisitingCardDetailsState();
}

class _VisitingCardDetailsState extends State<VisitingCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visiting Card Details"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
