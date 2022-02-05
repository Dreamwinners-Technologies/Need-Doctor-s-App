import 'package:flutter/material.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';
import 'package:need_doctors/models/ResearchModel/ResearchModel.dart';
import 'package:need_doctors/view/UpdateResearch/utils/ResearchCardDetails.dart';
import 'package:need_doctors/view/UpdateResearch/utils/ResearchDetails.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class ResearchCard extends StatelessWidget {
  ResearchCard(ResearchModel research, ResearchDetailsModel research2) {
    this.research = research;
    this.research2 = research2;
  }

  ResearchModel research;
  ResearchDetailsModel research2;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () {
          print("Tapped");
          //print(index);
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: ResearchDetails(research2),
            ),
          );
        },
        child: Card(
          child: Container(
            height: 120,
            padding: EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        " " + research.topic,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Journal Name : " ,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Author: " + research.fullName,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          //color: Colors.teal,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Published On: " + research.publishedOn,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
