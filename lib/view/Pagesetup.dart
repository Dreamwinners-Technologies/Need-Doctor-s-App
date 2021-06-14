import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/view/ControlPanel.dart';
import 'package:need_doctors/view/Home/HomePage.dart';
import 'package:need_doctors/view/Profile.dart';

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

            if (hasAdmin != null ||
                hasModerator != null ||
                hasSuperAdminRole != null) {
              setState(() {
                _currentIndex = index;
              });
            } else {
              sendToast(
                  'You Are Not Permitted to go on this page. This is for Admin & Moderators Only');
              throw new Exception('You Are Not Permitted to go on this page');
            }
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        unselectedItemColor: Colors.black87,
        items: [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.people), title: Text("Profile"),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.dashboard), title: Text("Control Panel"),
          ),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
