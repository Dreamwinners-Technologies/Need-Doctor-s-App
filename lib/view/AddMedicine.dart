import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/AddDrugRequest.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({Key key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
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
  List<String> listItems = [
    "Tablet",
    "Capsule",
    "Suspension",
    "Suppository",
    "IV Infusion",
    "Infusion",
    "Rapid Tablet"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileView(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Add Medicine"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          TextWidget(textValue: "Main Information's"),
          textBox(
              label: "Medicine Name",
              hint: "Enter Medicine Name",
              textController: nameController),
          textBox(
              label: "Generic Name",
              hint: "Enter Generic Name",
              textController: genericController),
          textBox(
              label: "Brand Name",
              hint: "Enter Brand Name",
              textController: brandNameController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              dropDownBox(),
              textBox(
                  label: "Pack Size",
                  hint: "Pack Size",
                  boxSize: MediaQuery.of(context).size.width / 2.5,
                  textController: packSizeController),
            ],
          ),
          TextWidget(textValue: "Details"),
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
          MaterialButton(
            minWidth: 120,
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
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
                sendToast("All Field's are must be filled up");
                throw new Exception("Field can't be empty");
              }

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

              MessageIdResponse messageIdResponse =
                  await addDrug(addDrugRequest: addDrugRequest);

              print(messageIdResponse.message);
              sendToast(messageIdResponse.message);
            },
            color: Color(0xff008080),
            child: Text('Save',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Center dropDownBox() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
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

  Container textBox(
      {String label,
      String hint,
      TextEditingController textController,
      double boxSize}) {
    if (boxSize == null) {
      boxSize = MediaQuery.of(context).size.width;
    }
    return Container(
      width: boxSize,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Color(0xff008080),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black26, fontSize: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container textFormBox(
      {String label, String hint, TextEditingController textController}) {
    bool _valid = true;
    if (textController.text.isNotEmpty) {
      _valid = false;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
        style: TextStyle(
          color: Color(0xff008080),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black26, fontSize: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextWidget({
    String textValue,
  }) {
    this.textValue = textValue;
  }

  String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      child: Text(
        textValue,
        style: TextStyle(
          color: Color(0xff008080),
          fontSize: 20,
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
