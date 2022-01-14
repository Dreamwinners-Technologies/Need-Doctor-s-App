import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:get/get.dart';
import 'package:need_doctors/Constant/widgets/bottomsheet.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/controller/controller.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/appointment/appointment_model.dart';
import 'package:need_doctors/networking/appointment_service/create_appointment_service.dart';

class PymentView extends StatefulWidget {
  final dynamic information;
  const PymentView({Key key, this.information}) : super(key: key);

  @override
  _PymentViewState createState() => _PymentViewState();
}

class _PymentViewState extends State<PymentView> {
  @override
  void initState() {
    super.initState();
  }

  final stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: sText("Payment", white, 15.0, FontWeight.bold),
        ),
        body: pymentBody(),
        bottomNavigationBar: bottomPaymentWidget(),
      ),
    );
  }

  Widget pymentBody() {
    return Container(
        width: double.infinity,
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(14.0),
            padding: EdgeInsets.all(14.0),
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(colors: [
                  primaryColor.withOpacity(0.4),
                  primaryLight.withOpacity(0.5)
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: sText(widget.information[0], whitecolor, 20.0,
                            FontWeight.bold)),
                    SizedBox(width: 20.0),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.0, vertical: 3.0),
                      alignment: Alignment.center,
                      child: sText(widget.information[2], primaryColor, 14.0,
                          FontWeight.bold),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20.0)),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sText("Age: " + widget.information[1], whitecolor, 15.0,
                        FontWeight.bold),
                    SizedBox(width: 10.0),
                    sText("Gender: " + widget.information[3], whitecolor, 15.0,
                        FontWeight.bold),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                sText("Fee " + widget.information[9].toString() + '/-',
                    whitecolor, 15.0, FontWeight.bold),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sText("Doctor", Colors.lightBlue, 12.0,
                              FontWeight.bold),
                          sText(widget.information[7], blackcolor, 14.0,
                              FontWeight.bold),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sText("Date", secondaryColor, 12.0, FontWeight.bold),
                        sText(widget.information[4].toString().split(" ").first,
                            red, 15.0, FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: whitecolor, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70.0,
                  width: 5.0,
                  decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  alignment: Alignment.center,
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: red)),
                  child: Icon(
                    Icons.close,
                    color: red,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: mText(
                      "NB: Please check all the information. Because you can not change or update any information after complate the proccess",
                      blackcolor.withOpacity(0.7),
                      12.0,
                      FontWeight.bold),
                )),
              ],
            ),
          )
        ]));
  }

  Widget bottomPaymentWidget() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: sText("Complete Appointment Process", primaryColor, 15.0,
                  FontWeight.bold),
            ),
            MaterialButton(
                minWidth: 75.0,
                height: 45.0,
                child: sText("Done", primaryColor, 16.0, FontWeight.bold),
                color: whitecolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  AppointmentModel appointment = AppointmentModel(
                      appointmentDate:
                          widget.information[4].toString().split(" ").first,
                      doctorId: widget.information[8],
                      gender: widget.information[3],
                      patientAddress: widget.information[5].toString(),
                      patientName: widget.information[0].toString(),
                      patientAge: widget.information[1].toString(),
                      patientProblem: widget.information[6].toString(),
                      patientPhoneNo: widget.information[10],
                      paymentMethod:
                          stateController.selectedPaymentType.toString());

                  askDialog(
                    context,
                    "Warning",
                    'Do you want get appointment now?',
                    DialogType.INFO,
                    () async {
                      customBottomSheet(context, 'Get Appointment...');
                      MessageIdResponse response =
                          await CreateAppointmentService()
                              .createAppointment(appointment, context);

                      if (response.message == 'Appointment Created') {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }

                      Navigator.pop(context);
                    },
                  );

                  //create appointment
                })
          ],
        ),
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(colors: [
              primaryColor.withOpacity(0.4),
              primaryLight.withOpacity(0.5)
            ])),
      ),
    );
  }
}
