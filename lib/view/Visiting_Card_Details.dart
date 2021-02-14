import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VisitingCardDetails extends StatefulWidget {
  @override
  _VisitingCardDetailsState createState() => _VisitingCardDetailsState();
}

class _VisitingCardDetailsState extends State<VisitingCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: Text("Visitng Details"),),
      body: Container(padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> 
          [
            
          ],),
      ))
    );
  }
}