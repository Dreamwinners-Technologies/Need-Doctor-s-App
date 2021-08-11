import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/models/StaticData/ResearchModel.dart';

class ResearchCard extends StatelessWidget {
  ResearchCard(ResearchModel research) {
    this.research = research;
  }

  ResearchModel research;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(6.0),
        child: Card(
          child: Container(
            height: 110,
            padding: EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Author: " + research.fullName,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Published On: " + research.publishedOn,
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        "Topic: " + research.topic,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
