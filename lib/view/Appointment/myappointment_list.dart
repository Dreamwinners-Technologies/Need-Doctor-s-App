// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/appointment/appointment_list_model.dart';
import 'package:need_doctors/networking/appointment_service/appointment_list_service.dart';

class MyAppointmentList extends StatefulWidget {
  @override
  _MyAppointmentListState createState() => _MyAppointmentListState();
}

class _MyAppointmentListState extends State<MyAppointmentList> {
  final _pagingController = PagingController<int, AppointmentList>(
    // 2
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPage = await AppointmentListService().getAppoinmentList(
        pageNo: pageKey,
        pageSize: 30,
      );

      print(newPage.data.length);

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      final isLastPage = newPage.lastPage;
      final newItems = newPage.data;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      // 4
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
          child: RefreshIndicator(
        onRefresh: () => Future.sync(
          // 2
          () => _pagingController.refresh(),
        ),
        child: Container(
          height: size.height,
          child: PagedListView.separated(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            pagingController: _pagingController,
            separatorBuilder: (context, index) => const SizedBox(
              height: 5.0,
            ),
            builderDelegate: PagedChildBuilderDelegate<AppointmentList>(
              itemBuilder: (context, article, index) {
                print(article.patientName);
                return;
              },
            ),
          ),
        ),
      )),
    );
  }
}

class AppointmentItemWidget extends StatelessWidget {
  AppointmentItemWidget({Key key, this.pagingController, this.index})
      : super(key: key);
  PagingController<int, AppointmentList> pagingController;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: whitecolor,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: sText(
                            pagingController.itemList[index].patientName,
                            primarycolor,
                            19.0,
                            FontWeight.bold)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        color: red.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: sText(
                          pagingController.itemList[index].isPaid
                              ? 'Paid'
                              : 'Not Paid',
                          Colors.white,
                          14.0,
                          FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: sText(
                            "Gender: " +
                                    pagingController.itemList[index].gender ??
                                'null',
                            greylightColor,
                            14.0,
                            FontWeight.normal)),
                  ],
                ),
                Container(
                    child: sText(
                        "Appointment Date: " +
                                pagingController
                                    .itemList[index].appointmentDate ??
                            'null',
                        Colors.indigo.withOpacity(0.6),
                        14.0,
                        FontWeight.normal)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 7.0),
                      decoration: BoxDecoration(
                          color: gray.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                      child: sText(
                          pagingController.itemList[index].isCompleted
                              ? 'Completed'
                              : 'Pending',
                          greylightColor.withOpacity(0.7),
                          14.0,
                          FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    sText(
                        "Fee " +
                                pagingController.itemList[index].doctorsFee
                                    .toString() +
                                '/-' ??
                            'null',
                        greylightColor,
                        12.0,
                        FontWeight.normal),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
