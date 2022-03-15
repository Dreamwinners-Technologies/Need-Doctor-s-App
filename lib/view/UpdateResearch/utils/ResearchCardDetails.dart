import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_doctors/Colors/Colors.dart';
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
          width: MediaQuery.of(context).size.width * .8,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 1.0, right: 1.0, top: 2.0, bottom: 10.0),
              child: Text(
                research.headline,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
            "Journal : " + research.journalName,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 5,
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
            "By  " + research.author,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue.shade200,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 2,
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
        SizedBox(height: 10,),
        Column(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .8,
              child: Text(
                research.abstractText,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            InkWell(
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                        onTap: () async {
                          print(research.link);
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                        Container(
                        child: RaisedButton (
                        onPressed: () async {
                    launch(research.link);
                    if(await canLaunch(research.link)){
                      await launch(research.link);
                    }else {
                      throw "Could not launch $research.link";
                    }
                    },
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(4.0),
                    splashColor: Colors.grey,
                    child: Text("Read More")))
          ],
        ),
      ),
    ),
    ),
    ],
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
