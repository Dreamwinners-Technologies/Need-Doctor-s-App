// import 'package:flutter/cupertino.dart';
//
// Container specializationContainer() {
//   return Container(
//     height: 65.0,
//     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         color: Color(0xff00BAA0),
//         border: Border.all(color: Color(0xff00BAA0))),
//     child: DropdownButton(
//       hint: Text("Select Your Speciality",
//           style: TextStyle(color: Colors.white, fontSize: 20)),
//       iconSize: 40,
//       dropdownColor: primaryLight,
//       isExpanded: true,
//       onChanged: (val) {
//         setState(() {
//           this.selectSpeciality = val;
//         });
//       },
//       value: this.selectSpeciality,
//       items: specalizationlist.map(
//             (val) {
//           return DropdownMenuItem(
//             value: val,
//             child: Text(
//               val,
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//           );
//         },
//       ).toList(),
//     ),
//   );
// }}