// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/controlpenal/ControlPanel.dart';
import 'package:need_doctors/view/Home/HomePage.dart';
import 'package:need_doctors/view/Profile/Profile.dart';

FlutterSecureStorage storage = FlutterSecureStorage();

class PageSetup extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PageSetup> {
  int _currentIndex = 0;
  final pages = [HomeScreen(), Profile(), ControlPanel()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: white,
        elevation: 2.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        onTap: (int index) async {
          if (index == 2) {
            String hasAdmin = await storage.read(key: 'jwtRoleADMIN');
            String hasModerator = await storage.read(key: 'jwtRoleMODERATOR');
            String hasSuperAdminRole =
                await storage.read(key: 'jwtRoleSUPER_ADMIN');

            //   if (hasAdmin != null ||
            //       hasModerator != null ||
            //       hasSuperAdminRole != null) {
            //     setState(() {
            //       _currentIndex = index;
            //     });
            //   } else {
            //     sendToast(
            //         'You Are Not Permitted to go on this page. This is for Admin & Moderators Only');
            //     throw new Exception('You Are Not Permitted to go on this page');
            //   }
            // } else {
            setState(
              () {
                _currentIndex = 2;
                print(_currentIndex);
              },
            );
          } else {
            setState(
              () {
                _currentIndex = index;
                print(_currentIndex);
              },
            );
          }
        },
        unselectedItemColor: Colors.black87,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text(
              "Profile",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text(
              "Control Panel",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
