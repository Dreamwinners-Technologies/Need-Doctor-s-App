import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';

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
final gotext = Text('GO',
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
final myprofiletex = Text("My Profile");
final accountlogo = Image.asset("asset/Avatar1.png");
final drnametext = Text(
  "Dr. Name",
  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: white),
);
final phonetext = Text(
  "018******",
  style: TextStyle(fontSize: 19.0,  color: primaryLight),
);
//Edit Profile:
final myinfo = Text('My Information',
    style: TextStyle(
      color: primaryColor,
      fontSize: 20,
    ));
final editprofile = Text("Edit Profile");
final drname = "Dr. Name";
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
  color: primaryLight,
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
