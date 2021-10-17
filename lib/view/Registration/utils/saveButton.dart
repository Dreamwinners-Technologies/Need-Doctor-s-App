import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/bottomsheet.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Registration/RegistrationRequestModel.dart';
import 'package:need_doctors/networking/LoginRegistrationNetwork.dart';
import 'package:need_doctors/view/otp/OtpScreen.dart';

//providous
// ignore: must_be_immutable
// class SaveButton extends StatelessWidget {
//   TextEditingController nameController;
//   TextEditingController emailController;
//   TextEditingController phoneController;
//   TextEditingController orgController;
//   TextEditingController bmdcRegController;

//   String selectedItem, selectDis, selectThan, selectSpeciality;
//   int distId;

//   //agree checking:
//   bool isChecked = false;

//   SaveButton(
//       {this.nameController,
//       this.emailController,
//       this.phoneController,
//       this.orgController,
//       this.bmdcRegController,
//       this.selectedItem,
//       this.distId,
//       this.selectDis,
//       this.selectThan,
//       this.selectSpeciality,
//       this.isChecked});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       minWidth: 100,
//       height: 35,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(24.0))),
//       onPressed: () async {
//         List<String> role = [];

//         if (selectedItem == "Doctor") {
//           print(selectedItem);
//           role.add("DOCTOR");
//         } else {
//           role.add("USER");
//         }

//         RegistrationRequestModel registrationModel = RegistrationRequestModel(
//             name: nameController.text,
//             phoneNo: phoneController.text,
//             role: role,
//             bmdcRegistrationNo: bmdcRegController.text,
//             specialization: selectSpeciality,
//             thana: selectThan,
//             district: selectDis);

//         int statusCode = await attemptRegister(requestModel: registrationModel);

//         print(statusCode);

//         if (statusCode == 201) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OtpScreen(registrationModel.phoneNo),
//             ),
//           );
//         } else {
//           sendToast("Please Try Again");
//         }
//       },
//       color: white,
//       child: sText('Save', primaryColor, 25, FontWeight.bold),
//     );
//   }
// }

//new

// ignore: must_be_immutable
class SaveButton extends StatelessWidget {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController orgController;
  TextEditingController bmdcRegController;

  String selectedItem, selectDis, selectThan, selectSpeciality;
  int distId;

  //agree checking:
  bool isChecked = false;

  SaveButton(
      {this.nameController,
      this.emailController,
      this.phoneController,
      this.orgController,
      this.bmdcRegController,
      this.selectedItem,
      this.distId,
      this.selectDis,
      this.selectThan,
      this.selectSpeciality,
      this.isChecked});

  @override
  Widget build(BuildContext context) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    return MaterialButton(
      minWidth: 100,
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
      onPressed: () async {
        List<String> role = [];
        if (nameController.text.isEmpty) {
          customDialog(context, "Empty", "Please Enter Your Name", DialogType.ERROR);
        } else if (emailController.text.isEmpty) {
          customDialog(context, "Empty", "Please Enter Your Email", DialogType.ERROR);
        } else if (!regex.hasMatch(emailController.text)) {
          customDialog(context, "Invalid", "Please Enter a Valid Email", DialogType.ERROR);
        } else if (phoneController.text.isEmpty) {
          customDialog(context, "Empty", "Please Enter Your Phone No.", DialogType.ERROR);
        } else if (!regExp.hasMatch(phoneController.text) || phoneController.text.length != 11) {
          customDialog(context, "Invalid", "Please Enter a Valid Phone No", DialogType.ERROR);
        } else if (selectedItem == null) {
          customDialog(context, "Empty", "Please Select Occuption", DialogType.ERROR);
        } else if (orgController.text.isEmpty) {
          customDialog(context, "Empty", "Please Enter Organization", DialogType.ERROR);
        } else if (selectedItem == 'Doctor') {
          if (bmdcRegController.text.isEmpty) {
            customDialog(context, "Empty", "Please Enter BMDC Reg No", DialogType.ERROR);
          } else if (selectSpeciality == null) {
            customDialog(context, "Empty", "Please Select Your Speciality", DialogType.ERROR);
          } else if (selectDis == null) {
            customDialog(context, "Empty", "Please Select Your District", DialogType.ERROR);
          } else if (selectThan == null) {
            customDialog(context, "Empty", "Please Select Your Thana", DialogType.ERROR);
          } else if (isChecked == false) {
            customDialog(context, "Check Box", "Please Check the Box", DialogType.ERROR);
          } else {
            //For Doctor Regi:
            customBottomSheet(context, "Register...");

            role.add("DOCTOR");
            print("Doctor Role");
            performRegistration(context, nameController, phoneController, role, bmdcRegController, selectSpeciality, selectThan,
                selectDis, emailController);
          }
        } else if (isChecked == false) {
          customDialog(context, "Check Box", "Please Check the Box", DialogType.ERROR);
        } else {
          customBottomSheet(context, "Register...");
          role.add("USER");

          performRegistration(context, nameController, phoneController, role, bmdcRegController, selectSpeciality, selectThan,
              selectDis, emailController);
          // if (selectedItem == "Doctor") {
          //   print(selectedItem);
          //   role.add("DOCTOR");
          // } else {
          //   role.add("USER");
          // }

        }
      },
      color: white,
      child: sText('Register', primaryColor, 25, FontWeight.bold),
    );
  }
}

performRegistration(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController phoneController,
    List<String> role,
    TextEditingController bmdcRegController,
    String selectSpeciality,
    String selectThan,
    String selectDis,
    TextEditingController emailController) async {

  RegistrationRequestModel registrationModel = RegistrationRequestModel(
      name: nameController.text,
      phoneNo: phoneController.text,
      role: role,
      bmdcRegistrationNo: bmdcRegController.text,
      specialization: selectSpeciality,
      thana: selectThan,
      district: selectDis,
      email: emailController.text);

  int statusCode = await attemptRegister(requestModel: registrationModel, context: context);

  print(statusCode);

  if (statusCode == 201) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(registrationModel.phoneNo),
      ),
    );
  } else {
    sendToast("Please Try Again");
  }
}
