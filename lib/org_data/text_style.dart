import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';

//Splash Screen:
final logo = 'asset/logog.png';
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
  'Login to your account',
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
  style: TextStyle(color: Color(0xff00BAA0), fontSize: 20),
);
