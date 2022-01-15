import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/AddDrugRequest.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/view/AddMedicien/utils/textFieldWidget.dart';
import 'package:need_doctors/view/AddMedicien/utils/textfrombox.dart';
import 'package:need_doctors/view/AddMedicien/utils/typelist.dart';

// ignore: must_be_immutable
class EditMedicine extends StatefulWidget {
  EditMedicine(DrugModelList itemList) {
    this.itemList = itemList;
  }

  DrugModelList itemList;

  @override
  _EditMedicineState createState() => _EditMedicineState(itemList);
}

class _EditMedicineState extends State<EditMedicine> {
  _EditMedicineState(DrugModelList itemList) {
    this.itemList = itemList;
    setData(itemList);
  }

  DrugModelList itemList;

  void setData(DrugModelList itemList) {
    nameController.text = itemList.name;
    administrationController.text = itemList.administration;
    brandNameController.text = itemList.brandName;
    adultDoseController.text = itemList.adultDose;
    contraindicationsController.text = itemList.contraindications;
    genericController.text = itemList.generic;
    indicationsController.text = itemList.indications;
    interactionController.text = itemList.interaction;
    modeOfActionController.text = itemList.modeOfAction;
    packSizeController.text = itemList.packSize;
    packSizeAndPriceController.text = itemList.packSizeAndPrice;
    precautionsAndWarningsController.text = itemList.precautionsAndWarnings;
    pregnancyAndLactationController.text = itemList.pregnancyAndLactation;
    renalDoseController.text = itemList.renalDose;
    childDoseController.text = itemList.childDose;
    sideEffectsController.text = itemList.sideEffects;
    therapeuticClassController.text = itemList.therapeuticClass;
    
    valueChoice = itemList.type;
  }

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
  TextEditingController precautionsAndWarningsController =
      TextEditingController();
  TextEditingController pregnancyAndLactationController =
      TextEditingController();
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
      body: profileView(size),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: sText("Edit Medicine", whitecolor, 19.0, FontWeight.bold),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //mybody
  Widget profileView(size) {
    return Container(
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8.0),
              child: sText(
                  "Main Information's", primarycolor, 19.0, FontWeight.bold),
            ),
            textBox(
                context: context,
                label: "Medicine Name",
                hint: "Enter Medicine Name",
                textController: nameController),
            textBox(
                context: context,
                label: "Generic Name",
                hint: "Enter Generic Name",
                textController: genericController),
            textBox(
                context: context,
                label: "Company Name",
                hint: "Enter Company Name",
                textController: brandNameController),
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
            textFormBox(
                label: "Indication",
                hint: "Enter Indication",
                textController: indicationsController),
            textFormBox(
                label: "Adult Dose",
                hint: "Enter Adult Dose",
                textController: adultDoseController),
            textFormBox(
                label: "Child Dose",
                hint: "Enter Child Dose",
                textController: childDoseController),
            textFormBox(
                label: "Renal dose",
                hint: "Enter Renal dose",
                textController: renalDoseController),
            textFormBox(
                label: "Administration",
                hint: "Enter Administration",
                textController: administrationController),
            textFormBox(
                label: "Contraindications",
                hint: "Enter Contraindications",
                textController: contraindicationsController),
            textFormBox(
                label: "Side effect",
                hint: "Enter Side effect",
                textController: sideEffectsController),
            textFormBox(
                label: "Precautions & warnings",
                hint: "Enter Precautions & warnings",
                textController: precautionsAndWarningsController),
            textFormBox(
                label: "Pregnancy & Lactation",
                hint: "Enter Pregnancy & Lactation",
                textController: pregnancyAndLactationController),
            textFormBox(
                label: "Therapeutic Class",
                hint: "Enter Therapeutic Class",
                textController: therapeuticClassController),
            textFormBox(
                label: "Mode of Action",
                hint: "Enter Mode of Action",
                textController: modeOfActionController),
            textFormBox(
                label: "Interaction",
                hint: "Enter Interaction",
                textController: interactionController),
            textFormBox(
                label: "Pack Size & Price",
                hint: "Enter Pack Size & Price",
                textController: packSizeAndPriceController),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                minWidth: 120,
                height: 40.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                    customDialog(context, 'Empty', "Field can't be empty",
                        DialogType.ERROR);
                  } else {
                    editmedicien();
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

  //Edit Medicien
  editmedicien() {
    askDialog(context, "Warning", 'Do you want to edit this Medicine?',
        DialogType.WARNING, () async {
      AddDrugRequest addDrugRequest = AddDrugRequest(
        name: nameController.text,
        phone: genericController.text,
        title: brandNameController.text,
        type: valueChoice,
        packSize: packSizeController.text,
        indications: interactionController.text,
        district: adultDoseController.text,
        childDose: childDoseController.text,
        renalDose: renalDoseController.text,
        thana: administrationController.text,
        contraindications: contraindicationsController.text,
        sideEffects: sideEffectsController.text,
        precautionsAndWarnings: precautionsAndWarningsController.text,
        pregnancyAndLactation: pregnancyAndLactationController.text,
        therapeuticClass: therapeuticClassController.text,
        modeOfAction: modeOfActionController.text,
        interaction: interactionController.text,
        packSizeAndPrice: packSizeAndPriceController.text,
      );

      MessageIdResponse messageIdResponse =
          await addDrug(addDrugRequest: addDrugRequest).whenComplete(() {
        Navigator.pop(context);
        sendToast("Congress! Medicien Edited ):");
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
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1.0, color: primarycolor)),
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

// ignore: must_be_immutable
class DropDownWidget extends StatelessWidget {
  DropDownWidget(
      {String valueChoice, List<String> listItems, double boxWidth}) {
    this.valueChoice = valueChoice;
    this.listItems = listItems;
    this.boxWidth = boxWidth;
  }

  String valueChoice;
  List<String> listItems;
  double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: boxWidth,
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1.0, color: Color(0xff008080))),
        child: DropdownButton(
          hint: Text(
            'Select Type',
            style: TextStyle(color: Colors.black26, fontSize: 20),
          ),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 50,
          iconEnabledColor: Color(0xff008080),
          underline: SizedBox(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
          ),
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

  void setState(Null Function() param0) {}
}
