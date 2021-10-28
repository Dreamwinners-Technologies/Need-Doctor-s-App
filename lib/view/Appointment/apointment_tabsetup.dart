import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/view/Appointment/doctor_list.dart';
import 'package:need_doctors/view/Appointment/myappointment_list.dart';

class AppoinmentTabSetup extends StatelessWidget {
  const AppoinmentTabSetup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primarycolor,
          title: Text("Appointments"),
          
          // leading: Container(),
          // toolbarHeight: 0.0,
          bottom: TabBar(
            
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child:
                    sText("Get Appointment", whitecolor, 16.0, FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child:
                    sText("My Appointment", whitecolor, 16.0, FontWeight.bold),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: [AppointmentPage(), MyAppointmentList()],
        ),
      ),
    );
  }
}
