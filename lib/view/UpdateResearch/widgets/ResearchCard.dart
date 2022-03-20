import 'package:flutter/material.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';
import 'package:need_doctors/view/UpdateResearch/utils/ResearchCardDetails.dart';
import 'package:need_doctors/view/UpdateResearch/utils/ResearchDetails.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class ResearchCard extends StatelessWidget {
  ResearchCard(ResearchData research) {
    this.research = research;
  }

  ResearchData research;

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
              child: ResearchDetails(research),
            ),
          );
        },
        child: Card(
          child: Container(
            // height: 120,
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
                        "Title: " + research.headline,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        "Author: " + research.author,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          //color: Colors.teal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        "Journal Name : " +research.journalName,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontStyle: FontStyle.italic
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Published On: " + research.publishDate,
                        style: TextStyle(
                          fontSize: 13.0,
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
