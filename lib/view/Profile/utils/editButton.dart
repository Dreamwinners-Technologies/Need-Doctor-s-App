import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/ProfileEdit/ProfileEdit.dart';



editbutton(BuildContext context) {
  return new Center(
    child: new Container(
      margin: const EdgeInsets.only(right: 14.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryLight,
        ),
      child: new Material(
        child: new InkWell(
          onTap: () {
            Navigator.push(context,
                               MaterialPageRoute(builder: (context) => ProfileEdit()));
          },
          child: new Container(
            width: 34.0,
            height: 34.0,
            child: Icon(Icons.edit),
            ),
          ),
        color: Colors.transparent,
        ),
      ),
    );
}
