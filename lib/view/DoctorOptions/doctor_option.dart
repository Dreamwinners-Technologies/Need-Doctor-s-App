import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/AddVisitingCard/AddCard.dart';
import 'package:need_doctors/view/EditVisitingcard/EditCard.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInput.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInputBig.dart';

class DoctorOption extends StatefulWidget {
  const DoctorOption({ Key key}) : super(key: key);

  @override
  _DoctorOptionState createState() => _DoctorOptionState();
}

class _DoctorOptionState extends State<DoctorOption> {

  TextEditingController phoneNoController = TextEditingController();
  TextEditingController shortDetailsController = TextEditingController();
  TextEditingController longDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Doctor Point"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Add - Edit Own Card",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "Contact With Admin",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      print('Received click');
                      CardInfoResponse ownCardResponse = await getOwnCard();
                      if (ownCardResponse != null) {
                        sendToast("You can't add more than one card.");
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => AddOwnCardPage(ownCardResponse)));
                            builder: (context) => AddCardPage(),
                          ),
                        );
                      }
                    },
                    child: const Text('Add Own Card'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      print('Received click');

                      CardInfoResponse ownCardResponse = await getOwnCard();

                      if (ownCardResponse != null){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => AddOwnCardPage(ownCardResponse)));
                            builder: (context) => EditCardPage(ownCardResponse),
                          ),
                        );
                      }
                       else {
                         sendToast("You Need Add Your Card First");
                      }
                    },
                    child: const Text('Edit Own Card'),
                  )
                ],
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      child: Text(
                        "Enter Your Problem to send to admin",
                        style: TextStyle(
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                    CustomInput(phoneNoController, "Contact No", "Enter Your Contact No", TextInputType.number),
                    CustomInput(shortDetailsController, "Short Details", "Enter Your Problem in Short", TextInputType.text),
                    CustomInputBig(longDetailsController, "Long Details", "Enter Your Problem in Long Details", TextInputType.text),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 18, vertical: 7))),
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () {
                          sendToast("Data Saved");
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            // EditCardPage(widget.ownCardResponse)
          ],
        ),
      ),
    );
  }
}
