import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';


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
  TextEditingController precautionsAndWarningsController = TextEditingController();
  TextEditingController pregnancyAndLactationController = TextEditingController();
  TextEditingController renalDoseController = TextEditingController();
  TextEditingController sideEffectsController = TextEditingController();
  TextEditingController therapeuticClassController = TextEditingController();

  String valueChoice;
  List<String> listItems = ["Tablet", "Capsule","Suspension","Suppository","IV Infusion", "Infusion","Rapid Tablet"];

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
          textBox(label: "Medicine Name", hint: "Enter Medicine Name"),
          textBox(label: "Generic Name", hint: "Enter Generic Name"),
          textBox(label: "Manufacturer Name", hint: "Enter Manufacturer Name"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              dropDownBox(),
              textBox(
                label: "Pack Size",
                hint: "Pack Size",
                boxSize: MediaQuery.of(context).size.width / 2.5,
              ),
            ],
          ),
          TextWidget(textValue: "Details"),
          textFormBox(label: "Indication", hint: "Enter Indication"),
          textFormBox(label: "Adult Dose", hint: "Enter Adult Dose"),
          textFormBox(label: "Child Dose", hint: "Enter Adult Dose"),
          textFormBox(label: "Renal dose", hint: "Enter Renal dose"),
          textFormBox(label: "Child Dose", hint: "Enter Adult Dose"),
          textFormBox(label: "Administration", hint: "Enter Administration"),
          textFormBox(label: "Side effect", hint: "Enter Side effect"),
          textFormBox(
              label: "Precautions & warnings",
              hint: "Enter Precautions & warnings"),
          textFormBox(
              label: "Pregnancy & Lactation",
              hint: "Enter Pregnancy & Lactation"),
          textFormBox(
              label: "Therapeutic Class", hint: "Enter Therapeutic Class"),
          textFormBox(label: "Mode of Action", hint: "Enter Mode of Action"),
          textFormBox(label: "Interaction", hint: "Enter Interaction"),
          textFormBox(
              label: "Pack Size & Price", hint: "Enter Pack Size & Price"),
          FadeAnimation(
            1,
            MaterialButton(
              minWidth: 100,
              height: 35,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
              onPressed: () {
                print("tap");
                print(valueChoice);
              },
              color: Color(0xff008080),
              child: Text('Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
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
