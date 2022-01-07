import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/AddDrugRequest.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/view/AddMedicien/utils/textFieldWidget.dart';
import 'package:need_doctors/view/AddMedicien/utils/textfrombox.dart';

// ignore: must_be_immutable
class AddAmbulance extends StatefulWidget {


  bool isWork;

  @override
  _AddAmbulanceState createState() => _AddAmbulanceState(isWork);
}

class _AddAmbulanceState extends State<AddAmbulance> {
  _AddAmbulanceState(bool isWork) {
    this.isWork = isWork;
  }

  bool isWork;

  //all info controller
  TextEditingController nameController = TextEditingController();
  TextEditingController thanaController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController divisionController = TextEditingController();

  String valueChoice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      appBar:
      AppBar(elevation: 0.0, backgroundColor: primaryColor, title: sText("Add Ambulance", whitecolor, 19.0, FontWeight.bold)),
      body: profileView(size),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView(Size size) {
    return Container(
      decoration: BoxDecoration(
          color: whitecolor, borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8.0),
              child: sText("Ambulance Info", primarycolor, 19.0, FontWeight.bold),
            ),
            textBox(context: context, label: "Driver Name", hint: "Enter Driver Name", textController: nameController),
            textBox(context: context, label: "Phone No", hint: "Enter Phone Number", textController: phoneController),
            textBox(context: context, label: "Title", hint: "Enter Title", textController: titleController),

            //Slecte Item:
           /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dropDownBox(),
                Expanded(
                    child: textBox(
                        context: context,
                        label: "Pack Size",
                        hint: "Pack Size",
                        boxSize: null,
                        textController: packSizeController)),
              ],
            ),*/
            textFormBox(label: "Division", hint: "Enter Division", textController: divisionController),
            textFormBox(label: "District", hint: "Enter District", textController: districtController),
            // textFormBox(label: "Adult Dose", hint: "Enter Adult Dose", textController: adultDoseController),
            // textFormBox(label: "Child Dose", hint: "Enter Child Dose", textController: childDoseController),
            // textFormBox(label: "Renal dose", hint: "Enter Renal dose", textController: renalDoseController),
            textFormBox(label: "Thana/Upazila", hint: "Enter Thana", textController: thanaController),
            //Save Button
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                minWidth: 120,
                height: 40.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () async {
                  print("tap");

                  if (nameController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      titleController.text.isEmpty ||
                      districtController.text.isEmpty ||
                      thanaController.text.isEmpty) {
                    customDialog(context, 'Empty', "Field can't be empty", DialogType.ERROR);
                  } else {
                    if (!isWork) {
                      sendToast("Data Submitted. Wait for admin approval.");
                      Navigator.pop(context);
                      throw new Exception("Fake Data Saved");
                    }
                    savemedicien();
                  }
                },
                color: primarycolor,
                child: sText("Save", white, 23.0, FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //You can change here , just copy/paste
  //Save Medicien
  savemedicien() {
    askDialog(context, "Warning", 'Do You want to add this Ambulance?', DialogType.WARNING, () async {
      AddDrugRequest addDrugRequest = AddDrugRequest(
        name: nameController.text,
        generic: phoneController.text,
        brandName: titleController.text,
        adultDose: districtController.text,
        administration: thanaController.text,
      );

      MessageIdResponse messageIdResponse = await addDrug(addDrugRequest: addDrugRequest).whenComplete(() {
        Navigator.pop(context);
        sendToast("Ambulance Added ):");
      });

      print(messageIdResponse.message);
      sendToast(messageIdResponse.message);
    });
  }
}
