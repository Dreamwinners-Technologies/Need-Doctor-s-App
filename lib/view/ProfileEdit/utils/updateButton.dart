import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/view/Home/utils/banner.dart';

class updateButton extends StatelessWidget {
  bool _status = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
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
              ),
            flex: 2,
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child:  RaisedButton(
                    child:  sText("Cancel", black, 18, FontWeight.bold),
                    color: white,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    )),
              ),
            flex: 2,
            ),
        ],
        ),
      );
  }

}
