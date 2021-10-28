import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';

//Splash Screen:
final logo = 'asset/images/doctor.png';
final need = Text(
  'Need',
  style:
      TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: primaryLight),
);

final doctor = Text(
  'Doctor',
  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: white),
);

final coummunity = Text(
  'Find Doctor Community',
  style: TextStyle(fontSize: 20, color: Colors.white),
);

//Login Screen:
final loginacc = Text(
  'Login To Your Account',
  style: TextStyle(fontSize: 20, color: Colors.black),
);
final phone = 'Phone';
final enterphone = 'Enter Your Phone';
final mapimage = "asset/images/bdmap.png";
final gotext = Text('Login',
    style: TextStyle(color: white, fontSize: 22, fontWeight: FontWeight.bold));

final nothaveacc = Text(
  'Not Have Account Yet?',
  style: TextStyle(color: Colors.white, fontSize: 20),
);
final register = Text(
  'Register',
  style: TextStyle(color: primaryLight, fontSize: 20),
);
//Registration Screen:
final regiacc = Text(
  'Crate Your Won Account',
  style: TextStyle(fontSize: 20, color: Colors.black),
);
final regitbtntex = Text(
  'Login',
  style: TextStyle(
      color: Color(0xff00BAA0), fontSize: 20, fontWeight: FontWeight.bold),
);

final alreadyacc = Text(
  'Already Have Account?',
  style: TextStyle(color: white, fontSize: 20),
);

//Otp Screen:
final enterotptext = "Enter OTP";
final lockimage = 'asset/password.png';
final otptile = Text(
  'We need to text you the OTP \n to authenticate your account',
  style:
      TextStyle(fontSize: 23, color: primaryColor, fontWeight: FontWeight.bold),
);
final submittex = Text('Submit',
    style: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));
//My Profile:
final myprofiletext = sText(" My Profile", white, 20, FontWeight.bold);

final drnametext = Text(
  "Mr. Demo",
  style: GoogleFonts.quicksand(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: black),
);
final occupation = Text(
  "Doctor/Others",
  style: GoogleFonts.quicksand(
      fontSize: 15.0, color: primaryLight, fontWeight: FontWeight.bold),
);
//Edit Profile:
final myinfo = Text('My Information',
    style: TextStyle(
      color: primaryColor,
      fontSize: 20,
    ));
final editprofile = sText("Edit Profile", white, 20, FontWeight.bold);
final drname = "User Name";
final bmdc = 'BMDC Reg';
final spacalization = 'Specalization';
final update = Text('Update',
    style: TextStyle(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold));
final discrit = Text(
  'District',
  style: TextStyle(color: primaryColor, fontSize: 20),
);
final thana = Text(
  'Thana',
  style: TextStyle(color: primaryColor, fontSize: 20),
);
final editfieldpadding = const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0);
final updatetext = Text("Update",
    style: TextStyle(
      fontSize: 19.9,
      fontWeight: FontWeight.bold,
      color: white,
    ));
final donotgetotptext = Text(
  "Don't get the OTP?",
  style: TextStyle(color: Color(0xff008080), fontSize: 18),
);
final resentotptext = Text(
  'Resend OTP.',
  style:
      TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
);

//Durg Details:
final drugtypestyle = TextStyle(
  color: Colors.amber,
  fontSize: 15.0,
);

final drugNamestyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);

final medicineicon = "asset/svg/medicines_icon.svg";
final durggenericstyle =
    TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 15.0);
final drugbrandnamestyle = TextStyle(
  color: white,
  fontSize: 16.0,
);
final othersbrand = Text(
  "Others Brand",
  style: TextStyle(color: white),
);
final padding14 = const EdgeInsets.only(top: 8.0);
