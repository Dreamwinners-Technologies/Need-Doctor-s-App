import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';

infotext(
    String phoneNumber,
    String speciality,
    String org,
    String thana,
    String bmdRegistrationNo,
    String designation,
    String qualification,
    String district,
    int pinNo,
    String email,
    userType) {
  print(org);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      _buildText(phoneNumber, "Phone No"),
      userType != 'USER'
          ? _buildText(speciality, "Specialization")
          : Container(),
      _buildText(org, "Organization"),
      userType != 'USER' ? _buildText(thana, "Thana") : Container(),

      userType != 'USER'
          ? _buildText(bmdRegistrationNo, "BMDC Registration No")
          : Container(),
      userType != 'USER' ? _buildText(designation, "Designation") : Container(),
      userType != 'USER' ? _buildText(district, "District") : Container(),
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
          style: GoogleFonts.quicksand(
              color: black, fontSize: 18, fontWeight: FontWeight.normal),
        ),
        // Text(
        //   labelText,
        //   style: GoogleFonts.quicksand(color: black, fontSize: 18, fontWeight: FontWeight.normal),
        // ),
        Text(
          labelText == null ? "" : labelText,
          style: GoogleFonts.quicksand(
              color: black.withOpacity(0.7),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
