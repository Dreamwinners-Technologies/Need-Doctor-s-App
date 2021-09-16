// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/string/routes_name.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/controller/controller.dart';
import 'package:need_doctors/view/Appointment/utils/bottom_view.dart';
import 'package:need_doctors/view/Appointment/utils/payment_select.dart';
import 'package:need_doctors/view/Appointment/utils/textfiled_item.dart';
import 'package:get/get.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key key}) : super(key: key);

  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _diseaseCotroller = TextEditingController();
  final TextEditingController _age = TextEditingController();

  List<String> typeNeg = [
    "Male",
    "Female",
  ];

  String dropdownValue = "Male";

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
                fee: '250',
                tap: () {
                  if (_nameController.text.isEmpty) {
                    customDialog(context, "Empty", "Please Enter Paitent Name",
                        DialogType.ERROR);
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
                        Navigator.pushNamed(context, PYMENT_ROUTE);
                      }
                    });
                  }
                },
              )),
        ));
  }

  //body:
  Widget appointmentbody() {
    return ListView(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      children: [
        Card(
          child: Container(
            padding:
                EdgeInsets.only(left: 14.0, right: 14.0, top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                fieldItem(_nameController, "Paitent Name", TextInputType.name),
                Row(
                  children: [
                    Expanded(
                      child:
                          fieldItem(_age, "Paitent Age", TextInputType.number),
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
                )
              ],
            ),
          ),
        )
      ],
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
