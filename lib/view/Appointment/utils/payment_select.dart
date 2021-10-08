import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/controller/controller.dart';

StateController stateController = Get.put(StateController());
// ignore: missing_return
Widget pymentselecteType(BuildContext context, GestureTapCallback tap) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      context: context,
      builder: (_) {
        return Container(
          margin: EdgeInsets.all(10.0),
          height: 270.0,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 65.0,
                  child: Divider(
                    thickness: 2.0,
                    color: gray,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 8.0),
                  child: sText("Choose Payment Type", blackcolor, 15.0,
                      FontWeight.bold)),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    stateController.selectedPaymentType.value = 'Cash';

                    print(stateController.selectedPaymentType.value);
                  },
                  child: pymenttypeItem("Cash", 'Cash'),
                );
              }),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    stateController.selectedPaymentType.value = 'Online_Pay';

                    print(stateController.selectedPaymentType.value);
                  },
                  child: pymenttypeItem("Online Pay", 'Online_Pay'),
                );
              }),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: primaryColor,
                            child: sText(
                                "Send", whitecolor, 14.0, FontWeight.bold),
                            onPressed: tap)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: red,
                            child: sText(
                                "Close", whitecolor, 14.0, FontWeight.bold),
                            onPressed: () {
                              Navigator.pop(context);
                              stateController.selectedPaymentType.value =
                                  'nothing';
                            }))
                  ],
                ),
              )
            ],
          ),
        );
      });
}

Widget pymenttypeItem(String title, String type) {
  return Container(
      margin: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [
            primaryColor.withOpacity(0.5),
            secondaryColor.withOpacity(0.3)
          ])),
      width: double.infinity,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sText(title, primaryColor, 20.0, FontWeight.bold),
          Container(
              padding: EdgeInsets.all(3.0),
              height: 25.0,
              width: 25.0,
              child: Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: stateController.selectedPaymentType.value == type
                        ? primaryColor
                        : Colors.transparent),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.0, color: whitecolor)))
        ],
      ));
}
