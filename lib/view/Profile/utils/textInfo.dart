import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';

infotext(String email, String phoneNumber, String specality, String org,
    String address) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      _buildText(email),
      _buildText(phoneNumber),
      _buildText(specality),
      _buildText(org),
      _buildText(address),
    ],
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
          width: .2,
        ),
      ),
    ),
    child: Text(
      labelText,
      style: GoogleFonts.quicksand(
          color: black, fontSize: 18, fontWeight: FontWeight.normal),
    ),
  );
}
