// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/models/appointment/appointment_list_model.dart';
import 'package:need_doctors/view/Prescription/widgets/PrescriptionCard.dart';

class PrescriptionList extends StatelessWidget {
  PrescriptionList({Key key, this.pagingController}) : super(key: key);

  var pagingController = PagingController<int, AppointmentList>(
    // 2
    firstPageKey: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PagedListView.separated(
        padding: EdgeInsets.only(left: 4.0, right: 4.0),
        pagingController: pagingController,
        separatorBuilder: (context, index) => const SizedBox(
          height: 5.0,
        ),
        builderDelegate: PagedChildBuilderDelegate<AppointmentList>(
          itemBuilder: (context, article, index) {
            return GestureDetector(
                onTap: () {
                  print("Tapped");
                  print(index);
                },
                child: PrescriptionCard(
                  pagingController.itemList[index],
                ));
          },
        ),
      ),
    );
  }
}
