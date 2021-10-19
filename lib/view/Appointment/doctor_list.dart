// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/models/appointment/doctor_list_model.dart';
import 'package:need_doctors/networking/appointment_service/doctor_list_service.dart';
import 'package:need_doctors/view/Appointment/get_appointment.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  TextEditingController searchController = TextEditingController();

  final _pagingController = PagingController<int, DoctorList>(
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
      print("search");
      var name = searchController.text;

      if (name != null) {
        if (name.isEmpty) {
          name = '';
        }
      }

      final newPage = await DoctorListService().getDoctorList(pageNo: pageKey, pageSize: 30, name: name);

      print(newPage.data.length);

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount = _pagingController.itemList?.length ?? 0;

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

  bool isWiritten = false;

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
            child: Column(
              children: [
                SearchWidget(
                  searchController: searchController,
                  isWiritten: isWiritten,
                  callback: () => _pagingController.refresh(),
                  searchBoxText: "Doctor",
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: PagedListView.separated(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    pagingController: _pagingController,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5.0,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<DoctorList>(
                      itemBuilder: (context, article, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Tapped");
                            print(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => GetAppointmentViw(
                                  docotrId: _pagingController.itemList[index].id,
                                  dortorName: _pagingController.itemList[index].doctorName,
                                  fee: _pagingController.itemList[index].doctorPrescription.fee,
                                ),
                              ),
                            );
                          },
                          child: DoctorItemWidget(pagingController: _pagingController, index: index),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorItemWidget extends StatelessWidget {
  DoctorItemWidget({Key key, this.pagingController, this.index}) : super(key: key);
  PagingController<int, DoctorList> pagingController;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, left: 3.0, right: 3.0),
      decoration: BoxDecoration(
        color: whitecolor,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: sText(pagingController.itemList[index].doctorName, primarycolor, 19.0, FontWeight.bold)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        color: red.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: sText('Appointment', Colors.white, 14.0, FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                    width: double.infinity,
                    child: sText(pagingController.itemList[index].specializations ?? 'null', greylightColor, 14.0,
                        FontWeight.normal)),
                Container(
                    width: double.infinity,
                    child:
                        sText(pagingController.itemList[index].phoneNo ?? 'null', greylightColor, 14.0, FontWeight.normal)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: sText(
                            pagingController.itemList[index].doctorPrescription.doctorChamberAddress.toString() ?? 'null',
                            greylightColor,
                            14.0,
                            FontWeight.bold)),
                    SizedBox(
                      width: 10.0,
                    ),
                    sText("Fee " + pagingController.itemList[index].doctorPrescription.fee.toString() + '/-' ?? 'null',
                        greylightColor, 12.0, FontWeight.normal),
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
