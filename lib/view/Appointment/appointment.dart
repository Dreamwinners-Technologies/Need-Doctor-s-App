// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/controller/controller.dart';
import 'package:need_doctors/view/Appointment/utils/bottom_view.dart';
import 'package:need_doctors/view/Appointment/utils/payment_select.dart';
import 'package:need_doctors/view/Appointment/utils/textfiled_item.dart';
import 'package:get/get.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:need_doctors/view/PymentView/pyment_view.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key key, this.dortorName, this.docotrId, this.fee})
      : super(key: key);
  final String dortorName;
  final String docotrId;
  final int fee;

  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _diseaseCotroller = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _address = TextEditingController();

  List<String> typeNeg = [
    "Male",
    "Female",
  ];

  String dropdownValue = "Male";
  String pickedDate = DateTime.now().toString();

  StateController stateController = Get.put(StateController());
  //String _date = "";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          stateController.selectedPaymentType.value = 'nothing';
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: sText("Get Appointment", white, 15.0, FontWeight.bold),
          ),
          body: FadeAnimation(0.4, appointmentbody()),

          //bottombar

          bottomNavigationBar: FadeAnimation(
              0.4,
              AppointmentBottomWidget(
                fee: widget.fee.toString(),
                tap: () {
                  if (_nameController.text.isEmpty) {
                    customDialog(context, "Empty", "Please Enter Paitent Name",
                        DialogType.ERROR);
                  } else if (_phoneController.text.isEmpty) {
                    customDialog(context, "Empty",
                        "Please Enter Paitent Phone No", DialogType.ERROR);
                  } else if (_age.text.isEmpty) {
                    customDialog(context, "Empty", "Please Enter Paitent Age",
                        DialogType.ERROR);
                  } else if (_diseaseCotroller.text.isEmpty) {
                    customDialog(
                        context,
                        "Empty",
                        "Enter a short reason overview for the get appointment",
                        DialogType.ERROR);
                  } else {
                    pymentselecteType(context, () {
                      if (stateController.selectedPaymentType.value ==
                          'nothing') {
                        customDialog(
                            context,
                            "Pyment Type",
                            "Please choose any a Payment Type",
                            DialogType.ERROR);
                      } else {
                        dynamic data = [
                          _nameController.text,
                          _age.text,
                          stateController.selectedPaymentType.value.toString(),
                          dropdownValue.toString(),
                          pickedDate,
                          _address.text,
                          _diseaseCotroller.text,
                          widget.dortorName,
                          widget.docotrId,
                          widget.fee,
                          _phoneController.text
                        ];
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PymentView(information: data)));
                        // Navigator.pushNamed(context, PYMENT_ROUTE, arguments: {
                        //   _nameController.text,

                        // });

                      }
                    });
                  }
                },
              )),
        ));
  }

  //body:
  Widget appointmentbody() {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding:
              EdgeInsets.only(left: 14.0, right: 14.0, top: 8.0, bottom: 8.0),
          child: Column(
            children: [
              fieldItem(_nameController, "Paitent Name", TextInputType.name),
              fieldItem(_phoneController, "Paitent Phone", TextInputType.phone),
              Row(
                children: [
                  Expanded(
                    child: fieldItem(_age, "Paitent Age", TextInputType.number),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  genderselector(),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) {
                  setState(() {
                    pickedDate = val;
                  });
                },
                onSaved: (val) {
                  setState(() {
                    pickedDate = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: TextField(
                  maxLength: 50 * 5,
                  minLines: 1,
                  maxLines: 6,
                  controller: _diseaseCotroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 14.0, top: 14.0),
                      hintText: 'Appointmnet Reason',
                      isDense: true,
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: TextField(
                  maxLength: 50 * 2,
                  minLines: 1,
                  maxLines: 3,
                  controller: _address,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 14.0, top: 14.0),
                      hintText: 'Address (optional)',
                      isDense: true,
                      border: OutlineInputBorder()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //selector
  Widget genderselector() {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        hint: Text("Gender"),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: typeNeg.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: sText(
                value, blackcolor.withOpacity(0.5), 12.0, FontWeight.bold),
          );
        }).toList(),
      ),
    ));
  }
}
