import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  EmptyPage(String appBarTitle) {
    this.appBarTitle = appBarTitle;
  }

  String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  appBarTitle + " is Coming Soon",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
