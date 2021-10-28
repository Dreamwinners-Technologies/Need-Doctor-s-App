// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:need_doctors/view/Prescription/view_prescription.dart';
import 'package:need_doctors/view/Prescription/widgets/PrescriptionCard.dart';

class PrescriptionList extends StatelessWidget {
  PrescriptionList({Key key, this.pagingController}) : super(key: key);

  var pagingController = PagingController<int, Datum>(
    // 2
    firstPageKey: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      padding: EdgeInsets.only(left: 4.0, right: 4.0),
      pagingController: pagingController,
      separatorBuilder: (context, index) => const SizedBox(
        height: 5.0,
      ),
      builderDelegate: PagedChildBuilderDelegate<Datum>(
        itemBuilder: (context, article, index) {
          return GestureDetector(
            onTap: () {
              print("Tapped");

              print(index);
              print(pagingController.itemList[0].appointmentId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ViewPrescription(
                    // url: 'https://google.com',
                    // url: 'https://prescription.a2sdms.com/app/prescription/' + pagingController.itemList[0].appointmentId,
                    url: 'https://a2s-dms-prescription-three.vercel.app/app/prescription/' + pagingController.itemList[index].appointmentId,
                  ),
                ),
              );
            },
            child: PrescriptionCard(
              pagingController.itemList[index],
            ),
          );
        },
      ),
    );
  }
}

class DefaultPrescriptinList extends StatelessWidget {
  DefaultPrescriptinList({Key key, this.pagingController}) : super(key: key);

  var pagingController = PagingController<int, Datum>(
    // 2
    firstPageKey: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      padding: EdgeInsets.only(left: 4.0, right: 4.0),
      pagingController: pagingController,
      separatorBuilder: (context, index) => const SizedBox(
        height: 5.0,
      ),
      builderDelegate: PagedChildBuilderDelegate<Datum>(
        itemBuilder: (context, article, index) {
          return Center(child: sText('Please Attemt', primaryColor, 23.0, FontWeight.bold));
        },
      ),
    );
  }
}
