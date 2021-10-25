import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/MessageIdResponse.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/view/EditVisitingcard/EditCard.dart';

// ignore: must_be_immutable
class VisitinItemWidget extends StatelessWidget {
  VisitinItemWidget({Key key, this.isAdmin, this.pagingController, this.index}) : super(key: key);
  bool isAdmin;
  PagingController<int, CardInfoResponse> pagingController;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, left: 3.0, right: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1.0, color: Color(0xff333333).withOpacity(0.3)),
      ),
      padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 12.0),
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
                    child: sText(pagingController.itemList[index].name, primarycolor, 19.0, FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: double.infinity,
                  child: mText1(pagingController.itemList[index].specialization, greylightColor.withOpacity(0.7), 16.0,
                      FontWeight.w500),
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
                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            color: Color(0xff1dcd4e).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: sText(pagingController.itemList[index].thana, Colors.white, 14.0, FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 7.0),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: sText(pagingController.itemList[index].district, whitecolor, 14.0, FontWeight.w500),
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
              String cardId = this.pagingController.itemList[index].id;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditCardPage(this.pagingController.itemList[index]),
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
          GestureDetector(
              onTap: () {
                String cardId = this.pagingController.itemList[index].id;
                print("Click");
                print(index);
                print(cardId);

                askDialog(context, "Ary You Sure", "Do you want to delete this card?", DialogType.ERROR, () async {
                  MessageIdResponse messageResponse = await deleteCard(cardId: cardId);

                  if (messageResponse != null) {
                    pagingController.refresh();
                  }
                });
              },
              child: Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 30,
              ))
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
