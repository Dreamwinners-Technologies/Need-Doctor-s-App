import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

specializationContainer1(
    BuildContext context, _specializaionItems, _selectedSpecializations) {
  return 
  Container(
    margin: EdgeInsets.only(top: 10.0),
    width: MediaQuery.of(context).size.width * .9,
    padding: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // color: Color(0xff00BAA0),
        // color: Colors.white,
        border: Border.all(width: 1.0, color: Color(0xffe7e7e7))),
    child: MultiSelectDialogField(
      // items: _items,
      items: _specializaionItems,
      title: sText(
          // "Select Your Speciality", Colors.black54, 17.0, FontWeight.w700),
          "Select Your Speciality",
          primarycolor,
          17.0,
          FontWeight.w700),
      selectedColor: primarycolor,
      buttonText:
          sText("Select Your Speciality", primarycolor, 17.0, FontWeight.w700),
      onConfirm: (results) {
        _selectedSpecializations = results.cast();
      },
    ),
  );
}

// class SpecalizationContainer extends StatefulWidget {
//   const SpecalizationContainer({Key key, this.specializaionItems, this.selectedSpecializations}) : super(key: key);
//   final List<MultiSelectItem> specializaionItems;
//   final dynamic selectedSpecializations;

//   @override
//   _SpecalizationContainerState createState() => _SpecalizationContainerState();
// }

// class _SpecalizationContainerState extends State<SpecalizationContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     margin: EdgeInsets.only(top: 10.0),
//     width: MediaQuery.of(context).size.width * .9,
//     padding: EdgeInsets.symmetric(horizontal: 5),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         // color: Color(0xff00BAA0),
//         // color: Colors.white,
//         border: Border.all(width: 1.0, color: Color(0xffe7e7e7))),
//     child: MultiSelectDialogField(
//       // items: _items,
//       items: spacalization,
//       title: sText(
//           // "Select Your Speciality", Colors.black54, 17.0, FontWeight.w700),
//           "Select Your Speciality",
//           primarycolor,
//           17.0,
//           FontWeight.w700),
//       selectedColor: primarycolor,
//       buttonText:
//           sText("Select Your Speciality", primarycolor, 17.0, FontWeight.w700),
//       onConfirm: (results) {
//         selectedSpecializations = results.cast();
//       },
//     ),
//   );;
//   }
// }
