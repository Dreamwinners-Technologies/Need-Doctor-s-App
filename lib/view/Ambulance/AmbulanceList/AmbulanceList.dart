import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class AmbulanceListView extends StatefulWidget {
  bool isAdmine;
  var pagingController = PagingController<int, CardInfoResponse>(
    // 2
    firstPageKey: 0,
  );

  AmbulanceListView({Key key, this.isAdmine, this.pagingController}) : super(key: key);

  @override
  _AmbulanceListViewState createState() => _AmbulanceListViewState();
}

class _AmbulanceListViewState extends State<AmbulanceListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PagedListView.separated(
        padding: EdgeInsets.only(left: 4.0, right: 4.0),
        pagingController: widget.pagingController,
        separatorBuilder: (context, index) => const SizedBox(
          height: 5.0,
        ),
        builderDelegate: PagedChildBuilderDelegate<CardInfoResponse>(
          itemBuilder: (context, article, index) {
            return GestureDetector(
              onTap: () {
                print("Tapped");
                print(index);
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft, child: null,
                    //child: VisitingCardInformation(cardInfoResponseList: widget.pagingController.itemList[index]),
                  ),
                );
              },
              //child: VisitingItemWidget(isAdmin: widget.isAdmine, pagingController: widget.pagingController, index: index),
            );
          },
        ),
      ),
    );
  }
}
