import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';
import 'package:need_doctors/view/Home/Widget/UsefulLinkWebview.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ResearchCardDetails extends StatelessWidget {
  ResearchCardDetails(ResearchData research2) {
    this.research = research2;
  }

  ResearchData research;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    child: Text(
                      research.headline,
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    child: Text(
                      "Journal Name : " + research.journalName,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    child: Text(
                      "Author : " + research.author,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    child: Text(
                      "Abstract : " + research.abstractText,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Published On: " + research.publishDate,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .8,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(onTap: () async {
                        print(research.link);


                      },
                        child: Text(
                          "Link : " + research.link,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
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
