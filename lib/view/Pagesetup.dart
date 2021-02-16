import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/AddMedicine.dart';
import 'package:need_doctors/view/HomePage.dart';
import 'package:need_doctors/view/Visitingcard_Info.dart';

class PageSetup extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PageSetup> {
  int _currentIndex = 0;
  final pages = [HomeScreen(), VisitingCardInformation(), AddMedicine()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryLight,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: white,
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
