import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInput.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInputBig.dart';

class Treatment extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text("Treatment"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: Text(
                  "Enter Information to Get Appointment",
                  style: TextStyle(
                    fontSize: 21.0,
                  ),
                ),
              ),
              CustomInput(nameController, "Name", "Enter Your Name", TextInputType.name),
              CustomInput(ageController, "Age", "Enter Your Age", TextInputType.number),
              CustomInput(addressController, "Address", "Enter Your Address", TextInputType.text),
              CustomInputBig(problemController, "Problem", "Enter Your Problem", TextInputType.text),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 18, vertical: 7))),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    sendToast("Data Saved");
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
