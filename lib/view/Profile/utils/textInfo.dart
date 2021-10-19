import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/objectbox.g.dart';
import 'package:need_doctors/org_data/text_style.dart';

infotext(String phoneNumber, String speciality, String org, String thana, String bmdRegistrationNo, String designation,
    String qualification, String district, int pinNo, String email) {


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      _buildText(phoneNumber, "Phone No"),
      _buildText(speciality, "Specialization"),
      _buildText(org, "Organization"),
      _buildText(thana, "Thana"),

      _buildText(bmdRegistrationNo, "BMDC Registration No"),
      _buildText(designation, "Designation"),
      _buildText(district, "District"),
      _buildText(pinNo.toString(), "Pin No"),
      _buildText(email, "Email"),

      // _buildText(specality),
      // _buildText(org),
      // _buildText(thana),
      // _buildText(bmdRegistrationNo),
      // _buildText(designation),
      // _buildText(qualification),
    ],
  );
}

_buildText(String labelText, String leadingText) {
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
    // child: Text(
    //   labelText == null ? "" : labelText,
    //   style: GoogleFonts.quicksand(color: black, fontSize: 18, fontWeight: FontWeight.normal),
    // ),
    child: Row(
      children: [
        Text(
          leadingText + " : ",
          style: GoogleFonts.quicksand(color: black, fontSize: 18, fontWeight: FontWeight.normal),
        ),
        // Text(
        //   labelText,
        //   style: GoogleFonts.quicksand(color: black, fontSize: 18, fontWeight: FontWeight.normal),
        // ),
        Text(
          labelText == null ? "" : labelText,
          style: GoogleFonts.quicksand(color: black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
