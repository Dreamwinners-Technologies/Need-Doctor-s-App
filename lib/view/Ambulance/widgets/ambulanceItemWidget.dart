// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';

import 'package:need_doctors/service/visiting_card_list.dart';
import 'package:need_doctors/view/EditVisitingcard/EditCard.dart';

// ignore: must_be_immutable
class ambulanceItem extends StatelessWidget {
  ambulanceItem({Key key, this.isAdmin, this.pagingController, this.index})
      : super(key: key);
  bool isAdmin;
  PagingController<int, CardInfoResponseList> pagingController;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, left: 3.0, right: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border:
            Border.all(width: 1.0, color: Color(0xff333333).withOpacity(0.3)),
      ),
      padding:
          EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    child: sText(pagingController.itemList[index].name,
                        primarycolor, 19.0, FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: double.infinity,
                  child: mText1(pagingController.itemList[index].specialization,
                      Colors.black.withOpacity(0.8), 16.0, FontWeight.w500),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6.0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                            color: primaryLight,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: sText(pagingController.itemList[index].thana,
                              Colors.white, 14.0, FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: sText(
                              pagingController.itemList[index].district,
                              whitecolor,
                              14.0,
                              FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          visibleUnVisibleWidget(context, index)
        ],
      ),
    );
  }

  visibleUnVisibleWidget(BuildContext context, int index) {
    if (this.isAdmin) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              print("Click");
              // ignore: unused_local_variable
              String cardId = this.pagingController.itemList[index].cardid;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditCardPage(this.pagingController.itemList[index]),
                ),
              ).then(
                (value) => this.pagingController.refresh(),
              );
              // _pagingController.refresh();
            },
            child: Icon(
              Icons.edit,
              color: primarylight,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // GestureDetector(
          //     onTap: () {
          //       String cardId = this.pagingController.itemList[index].cardid;
          //       print("Click");
          //       print(index);
          //       print(cardId);

          //       askDialog(
          //           context,
          //           "Ary You Sure",
          //           "Do you want to delete this card?",
          //           DialogType.ERROR, () async {
          //         MessageIdResponse messageResponse =
          //             await deleteCard(cardId: cardId);

          //         if (messageResponse != null) {
          //           pagingController.refresh();
          //         }
          //       });
          //     },
          //     child: Icon(
          //       Icons.delete,
          //       color: Colors.redAccent,
          //       size: 30,
          //     ))
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info,
            size: 30,
            color: primarycolor,
          )
        ],
      );
    }
  }
}
