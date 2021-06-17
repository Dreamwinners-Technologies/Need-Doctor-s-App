import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';

infotext(String name, String specality, String org,
    String discrict, String thana) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildText(name),
          _buildText(specality),
          _buildText(org),
          _buildText(discrict),
          _buildText(thana),
        ],
        ),
      ),
    );
}
_buildText(String labelText) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(bottom: 7.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1,
          ),
        ),
      ),
    child: Text(
      labelText,
      style: TextStyle(
          color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
}
