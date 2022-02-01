import 'package:flutter/material.dart';
import 'package:need_doctors/models/StaticData/ResearchModel.dart';


// ignore: must_be_immutable
class ResearchCardDetails extends StatelessWidget {
  ResearchCardDetails(ResearchModel research) {
    this.research = research;
  }

  ResearchModel research;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6.0),
      child: Card(
        child: Container(
          height: 160,
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
                      "" + research.topic,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Text(
                      "Journal Name : " + research.fullName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "Author : " + research.fullName,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "Abstract : " ,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Published On: " + research.publishedOn,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Link : " ,
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
    );
  }
  //for commit
}
