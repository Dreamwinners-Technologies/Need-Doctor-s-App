import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Registration/RegistrationRequestModel.dart';
import 'package:need_doctors/networking/LoginRegistrationNetwork.dart';
import 'package:need_doctors/view/otp/OtpScreen.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController orgController = TextEditingController();
  final TextEditingController bmdcRegController = TextEditingController();

  var selectedItem, selectDis, selectThan, selectSpeciality;
  int distId;

  //agree checking:
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      height: 35,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      onPressed: () async {
        List<String> role = [];

        if (selectedItem == "Doctor") {
          role.add("DOCTOR");
        } else {
          role.add("USER");
        }

        RegistrationRequestModel registrationModel = RegistrationRequestModel(
            name: nameController.text,
            phoneNo: phoneController.text,
            role: role,
            bmdcRegistrationNo: bmdcRegController.text,
            specialization: selectSpeciality,
            thana: selectThan,
            district: selectDis);

        int statusCode = await attemptRegister(requestModel: registrationModel);

        print(statusCode);

        if (statusCode == 201) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(registrationModel.phoneNo),
            ),
          );
        } else {
          sendToast("Please Try Again");
        }
      },
      color: white,
      child: sText('Save', primaryColor, 25, FontWeight.bold),
    );
  }
}
