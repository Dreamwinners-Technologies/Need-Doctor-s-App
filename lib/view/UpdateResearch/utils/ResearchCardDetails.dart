import 'package:flutter/material.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';


// ignore: must_be_immutable
class ResearchCardDetails extends StatelessWidget {
  ResearchCardDetails(ResearchDetailsModel research2) {
    this.research2 = research2;
  }

  ResearchDetailsModel research2;

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
                      "" + research2.topic,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    child: Text(
                      "Journal Name : " + research2.journalName,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "Author : " + research2.fullName,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "Abstract : " ,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Published On: " + research2.publishedOn,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Link : " + research2.link ,
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
