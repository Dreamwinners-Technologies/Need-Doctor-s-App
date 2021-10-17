import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/AddDrugRequest.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/models/api_message_response.dart';
import 'package:need_doctors/models/public_medicine_request.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/view/AddMedicien/utils/typelist.dart';
import 'package:need_doctors/view/PublicAddMedicine/widgets/medicine_input_box.dart';
import 'package:need_doctors/view/PublicAddMedicine/widgets/medicine_input_field.dart';

class PublicAddMedicine extends StatefulWidget {
  @override
  _PublicAddMedicineState createState() => _PublicAddMedicineState();
}

class _PublicAddMedicineState extends State<PublicAddMedicine> {
  TextEditingController nameController = TextEditingController();

  TextEditingController administrationController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();

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

  TextEditingController sideEffectsController = TextEditingController();

  String valueChoice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String inputHint = "Hi";
    String inputLabel = "Test1";

    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: sText("Add Medicine", whitecolor, 19.0, FontWeight.bold),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
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
              MedicineInputField(controller: nameController, inputLabel: "Medicine Name", inputHint: "Enter Medicine Name"),
              MedicineInputField(controller: genericController, inputLabel: "Generic Name", inputHint: "Enter Generic Name"),
              MedicineInputField(
                  controller: companyNameController, inputLabel: "Company Name", inputHint: "Enter Company Name"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  medicineTypeDropDown(),
                  Expanded(
                    child:
                        MedicineInputField(inputLabel: "Pack Size", inputHint: "Pack Size", controller: packSizeController),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: sText("Details", primarycolor, 19.0, FontWeight.bold)),
              MedicineInputBox(
                  controller: indicationsController, inputLabel: "Symptoms of the Disease", inputHint: "Enter Symptoms"),
              MedicineInputBox(controller: adultDoseController, inputLabel: "Medicine Dosage", inputHint: "Enter Dosage"),
              MedicineInputBox(
                  controller: administrationController,
                  inputLabel: "Medicine Administration",
                  inputHint: "Enter Administration"),
              MedicineInputBox(
                  controller: contraindicationsController,
                  inputLabel: "Medicine Contraindications",
                  inputHint: "Enter Contraindications"),
              MedicineInputBox(
                  controller: sideEffectsController,
                  inputLabel: "Side Side effect on Human",
                  inputHint: "Enter Side effect"),
              MedicineInputBox(
                  controller: precautionsAndWarningsController,
                  inputLabel: "Safety Measure And Caution",
                  inputHint: "Enter Precautions & warnings"),
              MedicineInputBox(
                  controller: pregnancyAndLactationController,
                  inputLabel: "Pregnancy & Lactation",
                  inputHint: "Enter Pregnancy & Lactation"),
              MedicineInputBox(
                  controller: modeOfActionController, inputLabel: "Mode of Action", inputHint: "Enter Mode of Action"),
              MedicineInputBox(controller: interactionController, inputLabel: "Interaction", inputHint: "Enter Interaction"),
              MedicineInputBox(
                  controller: packSizeAndPriceController,
                  inputLabel: "Pack Size & Price",
                  inputHint: "Enter Pack Size & Price"),
              SizedBox(
                height: 20.0,
              ),
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
                        companyNameController.text.isEmpty ||
                        contraindicationsController.text.isEmpty ||
                        valueChoice.isEmpty ||
                        packSizeAndPriceController.text.isEmpty ||
                        interactionController.text.isEmpty ||
                        interactionController.text.isEmpty ||
                        adultDoseController.text.isEmpty ||
                        administrationController.text.isEmpty ||
                        sideEffectsController.text.isEmpty ||
                        precautionsAndWarningsController.text.isEmpty ||
                        pregnancyAndLactationController.text.isEmpty ||
                        modeOfActionController.text.isEmpty ||
                        interactionController.text.isEmpty ||
                        packSizeAndPriceController.text.isEmpty) {
                      customDialog(context, 'Empty', "Field can't be empty", DialogType.ERROR);
                    } else {
                      saveMedicine();
                    }
                  },
                  color: primarycolor,
                  child: sText("Save", white, 23.0, FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded medicineTypeDropDown() {
    return Expanded(
      child: Container(
        height: 50.0,
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

  saveMedicine() {
    askDialog(context, "Warning", 'Do You want to add this Medicine?', DialogType.WARNING, () async {
      PublicMedicineRequest publicMedicineRequest = PublicMedicineRequest(
        brandName: nameController.text,
        genericName: genericController.text,
        companyName: companyNameController.text,
        form: valueChoice,
        packedSize: packSizeController.text,
        indication: interactionController.text,
        adultDose: adultDoseController.text,
        administration: administrationController.text,
        contraIndication: contraindicationsController.text,
        sideEffect: sideEffectsController.text,
        precaution: precautionsAndWarningsController.text,
        pregnancyCategoryNote: pregnancyAndLactationController.text,
        modeOfAction: modeOfActionController.text,
        interaction: interactionController.text,
        price: packSizeAndPriceController.text,
      );

      ApiMessageResponse apiMessageResponse =
          await addPublicDrug(publicMedicineRequest: publicMedicineRequest).whenComplete(() {
        Navigator.pop(context);
        Navigator.pop(context);
        sendToast("Congress! Medicine Added. Wait For Admin Approval ):");
      });
    });
  }
}
