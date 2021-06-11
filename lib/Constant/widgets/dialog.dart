import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

customDialog(
  BuildContext context,
  String tittle,
  String content,
  DialogType type,
) {
  AwesomeDialog(
    headerAnimationLoop: false,
    context: context,
    btnCancelColor: primarycolor,
    btnCancel: MaterialButton(
        color: primarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: sText("Cancel", whitecolor, 18.0, FontWeight.bold),
        onPressed: () {
          Navigator.pop(context);
        }),
    dialogType: type,
    animType: AnimType.TOPSLIDE,
    tittle: tittle,
    desc: content,
  ).show();
}
