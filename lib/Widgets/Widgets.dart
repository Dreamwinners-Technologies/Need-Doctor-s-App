import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/view/Appointment/doctor_list.dart';
import 'package:need_doctors/view/generic_search/Generic_search.dart';
import 'package:need_doctors/view/medicien_search/SearchMedicineNewNoSQL.dart';
import 'package:need_doctors/view/visitingCard/VisitingCard_ScreenNew.dart';

FlutterSecureStorage storage = FlutterSecureStorage();
//Home Items Widget:
homeItemWidget(String svg, String title, BuildContext context) {
  return Material(
    child: InkWell(
      onTap: () async {
        if (title == 'Search Medicine') {
          print("search0");
          // DrugListResponse drugListResponse =
          //     await getDrugList(pageSize: 250, pageNo: 0);

          print("1");
          // if (drugListResponse != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMedicineNewNoSQL(false)));
          // } else {
          //   sendToast("Something went wrong");
          //   throw new Exception("Something wrong");
          // }
        } else if (title == 'Medicine by Generic') {
          print(1);

          print("search2");
          Navigator.push(context, MaterialPageRoute(builder: (context) => GenericSearch()));
        } else if (title == 'Login Doctor') {
          print(1);

          Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentPage()));
        } else if (title == 'Add-Edit Own Card') {
          print(1);

          print("search3");
          // String hasDoctorRole = await storage.read(key: 'jwtRoleDOCTOR');

          // if (hasDoctorRole != null) {
          //   print("Working");
          //   OwnCardResponse ownCardResponse = await getOwnCard();
          //
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddOwnCardPage(ownCardResponse)));
          // } else {
          //   sendToast("Only Doctor Can add his own Visiting Card");
          // }
        } else if (title == 'Search Doctor') {
          // CardListResponse cardListResponse =
          //     await getCardList(pageNo: 0, pageSize: 500);

          print("search4");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VisitingCardListNew(
                isAdmin: false,
              ),
            ),
          );
        } else if (title == 'Update Research') {
          // DrugListResponse drugListResponse =
          //     await getDrugList(pageSize: 250, pageNo: 0);

          print("search5");
          // if (drugListResponse != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMedicineNewNoSQL(false)));
          // } else {
          //   sendToast("Something went wrong");
          //   throw new Exception("Something wrong");
          // }
        } else {
          print("search6");
          sendToast("The feature is coming soon.");
        }
      },
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), side: BorderSide(width: 1, color: Color(0xffe7e7e7))),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          height: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 10)) / 3,
          width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 10)) / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                height: 50.0,
                width: 50.0,
                child: SvgPicture.asset(
                  svg,
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff333333),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

// controlwidget(String svg, String title, BuildContext context) {
//   return Material(
//     child: InkWell(
//       onTap: () async {
//         print(MediaQuery.of(context).size.width);
//         print(MediaQuery.of(context).size.height);
//         if (title == 'Add Moderator') {
//           String hasAdminRole = await storage.read(key: 'jwtRoleADMIN');
//           String hasSuperAdminRole =
//               await storage.read(key: 'jwtRoleSUPER_ADMIN');
//           print(hasAdminRole);
//           List<ModeratorListResponse> moderatorList = await getModeratorList();

//           if (hasAdminRole != null || hasSuperAdminRole != null) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ModeratorPage(moderatorList)));
//           } else {
//             sendToast('You are not permitted to do this operation');
//             throw new Exception('You are not permitted to do this operation');
//           }
//         } else if (title == 'Add Drug') {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => AddMedicine()));
//         } else if (title == 'Add Visiting card') {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => AddCardPage()));
//         } else if (title == 'Edit Drug') {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => SearchMedicineNew(true)));
//         } else if (title == 'Edit Visiting Card') {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => VisitingCardListNew(
//                         isAdmin: true,
//                       )));
//         }
//       },
//       child: Card(
//         elevation: 0.0,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//             side: BorderSide(width: 1, color: Color(0xffe7e7e7))),
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(8.0),
//           height: (MediaQuery.of(context).size.width -
//                   (MediaQuery.of(context).size.width / 10)) /
//               3,
//           width: (MediaQuery.of(context).size.width -
//                   (MediaQuery.of(context).size.width / 10)) /
//               3,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(bottom: 8.0),
//                 height: 50.0,
//                 width: 50.0,
//                 child: SvgPicture.asset(
//                   svg,
//                   color: primarycolor,
//                 ),
//               ),
//               FittedBox(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 12.0,
//                         color: Color(0xff333333),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

//Custom SearchBar
customSearchWidget({String title, TextEditingController controller, BuildContext context, VoidCallback callback}) {
  return Container(
    height: 50.0,
    padding: EdgeInsets.only(left: 5.0, right: 5.0),
    margin: EdgeInsets.only(left: 12.0, top: 14.0),
    decoration: BoxDecoration(color: Color(0xffF5F3F3), borderRadius: BorderRadius.circular(20.0)),
    child: Stack(
      children: [
        TextField(
          controller: controller,
          // ignore: deprecated_member_use
          maxLengthEnforced: false,
          decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xffB2B2B2)),
              hintText: title,
              border: InputBorder.none,
              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(14.0),
            height: MediaQuery.of(context).size.width * .12,
            width: MediaQuery.of(context).size.width * .12,
            decoration: BoxDecoration(
                color: Color(0xffF5F3F3),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), topRight: Radius.circular(20.0))),
            child: GestureDetector(
                // onTap: () async {
                //   print("search");
                //   var name = controller.text;
                //
                //   CardListResponse cards =
                //       await getCardList(name: name, pageNo: 0, pageSize: 100);
                // },
                onTap: callback,
                child: SvgPicture.asset("asset/svg/search_icon.svg")),
          ),
        )
      ],
    ),
  );
}

//Medicine Search item:
// medicineitem(
//     List<DrugDbModel> drugModelList, int index, BuildContext context) {
//   String medicineType;
//   if (drugModelList[index].type == "Tablet" ||
//       drugModelList[index].type == "Rapid Tablet") {
//     medicineType = "asset/svg/types/tablet.svg";
//   } else if (drugModelList[index].type == "Capsule") {
//     medicineType = "asset/svg/types/capsule.svg";
//   } else if (drugModelList[index].type == "Suspension") {
//     medicineType = "asset/svg/types/suspension.svg";
//   } else if (drugModelList[index].type == "Suppository") {
//     medicineType = "asset/svg/types/suppository.svg";
//   } else if (drugModelList[index].type == "IV Infusion" ||
//       drugModelList[index].type == "Infusion") {
//     medicineType = "asset/svg/types/infusion.svg";
//   } else if (drugModelList[index].type == "Cream") {
//     medicineType = "asset/svg/types/cream.svg";
//   } else if (drugModelList[index].type == "Drop") {
//     medicineType = "asset/svg/types/drop.svg";
//   } else if (drugModelList[index].type == "Syrup") {
//     medicineType = "asset/svg/types/syrup.svg";
//   } else {
//     medicineType = "asset/svg/types/tablet.svg";
//   }
//
//   return GestureDetector(
//     onTap: () {
//       print(index);
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   DragDetails(drugModelList[index], medicineType)));
//     },
//     child: Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(10.0),
//         height: 120,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 15.0),
//                   width: 60.0,
//                   height: 60.0,
//                   child: SvgPicture.asset(
//                     medicineType,
//                     color: primaryColor,
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           child: Text(
//                             drugModelList[index].name,
//                             style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.bold,
//                                 color: primaryColor),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 4, bottom: 4),
//                           child: Text(
//                             drugModelList[index].packSize,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                                 color: primaryColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       drugModelList[index].generic,
//                       style: TextStyle(fontSize: 15, color: Color(0xff464646)),
//                     ),
//                     Text(
//                       drugModelList[index].type,
//                       style: TextStyle(fontSize: 15, color: Color(0xff464646)),
//                     ),
//                     Text(
//                       drugModelList[index].brandName,
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: primaryColor),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(right: 20),
//               child: Icon(
//                 Icons.info,
//                 size: 30,
//                 color: primaryColor,
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

doctoritem(String name, String specality, String address, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(index);
    },
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryColor),
            ),
            Text(
              specality,
              style: TextStyle(fontSize: 15.0, color: primaryColor),
            ),
            Text(
              address,
              style: TextStyle(fontSize: 15.0, color: Color(0xff464646)),
            ),
          ],
        ),
      ),
    ),
  );
}

genericitem(String name, BuildContext context) {
  if (name == null) {
    return;
  }

  return GestureDetector(
    onTap: () async {
      print(11);
      // DrugListResponse drugListResponse =
      //     await getDrugList(pageSize: 250, pageNo: 0, generic: name);

      // if (drugListResponse != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchMedicineNewNoSQL(false),
        ),
      );
      // } else {
      //   sendToast("Something went wrong");
      //   throw new Exception("Something wrong");
      // }
    },
    child: Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        padding: EdgeInsets.all(6.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    ),
  );
}

//Medicine Search item:
managemedicineitem(String image, String title, String category, String how, String cName, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(index);
    },
    child: Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 50.0,
        margin: EdgeInsets.only(bottom: 0.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ooo',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryColor),
            ),
          ],
        ),
      ),
    ),
  );
}
