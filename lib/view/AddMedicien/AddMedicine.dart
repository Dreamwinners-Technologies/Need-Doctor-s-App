import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:need_doctors/view/AddMedicien/utils/typelist.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine(bool isWork) {
    this.isWork = isWork;
  }

  bool isWork;

  @override
  _AddMedicineState createState() => _AddMedicineState(isWork);
}

class _AddMedicineState extends State<AddMedicine> {
  _AddMedicineState(bool isWork) {
    this.isWork = isWork;
  }

  bool isWork;

  //all info controller
  TextEditingController nameController = TextEditingController();
  TextEditingController administrationController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController adultDoseController = TextEditingController();
  TextEditingController contraindicationsController = TextEditingController();
  TextEditingController genericController = TextEditingController();
  TextEditingController indicationsController = TextEditingController();
  TextEditingController interactionController = TextEditingController();
  TextEditingController modeOfActionController = TextEditingController();
  TextEditingController packSizeController = TextEditingController();
  TextEditingController packSizeAndPriceController = TextEditingController();
  TextEditingController precautionsAndWarningsController = TextEditingController();
  TextEditingController pregnancyAndLactationController = TextEditingController();
  TextEditingController renalDoseController = TextEditingController();
  TextEditingController childDoseController = TextEditingController();
  TextEditingController sideEffectsController = TextEditingController();
  TextEditingController therapeuticClassController = TextEditingController();

  String valueChoice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      appBar:
          AppBar(elevation: 0.0, backgroundColor: primaryColor, title: sText("Add Medicine", whitecolor, 19.0, FontWeight.bold)),
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
              child: sText("Main Information's", primarycolor, 19.0, FontWeight.bold),
            ),
            textBox(context: context, label: "Medicine Name", hint: "Enter Medicine Name", textController: nameController),
            textBox(context: context, label: "Generic Name", hint: "Enter Generic Name", textController: genericController),
            textBox(context: context, label: "Company Name", hint: "Enter Company Name", textController: brandNameController),

            //Slecte Item:
            Row(
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
            ),

            Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: sText("Details", primarycolor, 19.0, FontWeight.bold)),
            textFormBox(label: "Indication", hint: "Enter Indication", textController: indicationsController),
            textFormBox(label: "Adult Dose", hint: "Enter Adult Dose", textController: adultDoseController),
            textFormBox(label: "Child Dose", hint: "Enter Child Dose", textController: childDoseController),
            textFormBox(label: "Renal dose", hint: "Enter Renal dose", textController: renalDoseController),
            textFormBox(label: "Administration", hint: "Enter Administration", textController: administrationController),
            textFormBox(label: "Contraindications", hint: "Enter Contraindications", textController: contraindicationsController),
            textFormBox(label: "Side effect", hint: "Enter Side effect", textController: sideEffectsController),
            textFormBox(
                label: "Precautions & warnings",
                hint: "Enter Precautions & warnings",
                textController: precautionsAndWarningsController),
            textFormBox(
                label: "Pregnancy & Lactation",
                hint: "Enter Pregnancy & Lactation",
                textController: pregnancyAndLactationController),
            textFormBox(label: "Therapeutic Class", hint: "Enter Therapeutic Class", textController: therapeuticClassController),
            textFormBox(label: "Mode of Action", hint: "Enter Mode of Action", textController: modeOfActionController),
            textFormBox(label: "Interaction", hint: "Enter Interaction", textController: interactionController),
            textFormBox(label: "Pack Size & Price", hint: "Enter Pack Size & Price", textController: packSizeAndPriceController),

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
                      genericController.text.isEmpty ||
                      brandNameController.text.isEmpty ||
                      contraindicationsController.text.isEmpty ||
                      valueChoice.isEmpty ||
                      packSizeAndPriceController.text.isEmpty ||
                      interactionController.text.isEmpty ||
                      interactionController.text.isEmpty ||
                      adultDoseController.text.isEmpty ||
                      childDoseController.text.isEmpty ||
                      renalDoseController.text.isEmpty ||
                      administrationController.text.isEmpty ||
                      sideEffectsController.text.isEmpty ||
                      precautionsAndWarningsController.text.isEmpty ||
                      pregnancyAndLactationController.text.isEmpty ||
                      therapeuticClassController.text.isEmpty ||
                      modeOfActionController.text.isEmpty ||
                      interactionController.text.isEmpty ||
                      packSizeAndPriceController.text.isEmpty) {
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

  //Save Medicien
  savemedicien() {
    askDialog(context, "Warning", 'Do You want to add this Medicine?', DialogType.WARNING, () async {
      AddDrugRequest addDrugRequest = AddDrugRequest(
        name: nameController.text,
        generic: genericController.text,
        brandName: brandNameController.text,
        type: valueChoice,
        packSize: packSizeController.text,
        indications: interactionController.text,
        adultDose: adultDoseController.text,
        childDose: childDoseController.text,
        renalDose: renalDoseController.text,
        administration: administrationController.text,
        contraindications: contraindicationsController.text,
        sideEffects: sideEffectsController.text,
        precautionsAndWarnings: precautionsAndWarningsController.text,
        pregnancyAndLactation: pregnancyAndLactationController.text,
        therapeuticClass: therapeuticClassController.text,
        modeOfAction: modeOfActionController.text,
        interaction: interactionController.text,
        packSizeAndPrice: packSizeAndPriceController.text,
      );

      MessageIdResponse messageIdResponse = await addDrug(addDrugRequest: addDrugRequest).whenComplete(() {
        Navigator.pop(context);
        sendToast("Congress! Medicien Added ):");
      });

      print(messageIdResponse.message);
      sendToast(messageIdResponse.message);
    });
  }

  //selecte Type:
  dropDownBox() {
    return Expanded(
      child: Container(
        height: 45.0,
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.all(width: 1.0, color: primarycolor)),
        child: DropdownButton(
          hint: sText('Select Type', Colors.black54, 17.0, FontWeight.bold),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black54,
          ),
          isDense: true,
          isExpanded: true,
          iconSize: 40,
          iconEnabledColor: primarycolor,
          underline: SizedBox(),
          style: TextStyle(color: primarycolor, fontSize: 17.0),
          value: valueChoice,
          onChanged: (newValue) {
            setState(() {
              this.valueChoice = newValue;
            });
          },
          items: listItems.map(
            (valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
