import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

class UpdateButton extends StatefulWidget {
  @override
  _UpdateButtonState createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  // ignore: unused_field
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              // ignore: deprecated_member_use
              child:  RaisedButton(
                child: sText("Save", white, 18, FontWeight.bold),
                textColor: Colors.white,
                color: primarycolor,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus( FocusNode());
                  });
                },
                shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                )),
         
        ],
        ),
      );
  }
}
