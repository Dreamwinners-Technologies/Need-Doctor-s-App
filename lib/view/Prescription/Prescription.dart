import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:need_doctors/networking/prescription/my_prescription_service.dart';
import 'package:need_doctors/view/Prescription/widgets/prescription_list.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

class MyPrescription extends StatefulWidget {
  @override
  _MyPrescriptionState createState() => _MyPrescriptionState();
}

class _MyPrescriptionState extends State<MyPrescription> {
  final _pagingController = PagingController<int, Datum>(
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
      final newPage = await getMyPrescriptionList(
        query: '',
        pageNo: pageKey,
        pageSize: 30,
      );

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

  // Future<void> _fetchPageOthes() async {
  //   getOthersPrescriptionList(
  //     pinNo: 9999,
  //     phoneNo: '01515212687',
  //     pageNo: 0,
  //     pageSize: 30,
  //   );
  // }

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => Future.sync(
            // 2
            () => _pagingController.refresh(),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SearchWidget(
                  searchController: null,
                  isWiritten: false,
                  callback: null,
                  searchBoxText: ".",
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: PrescriptionList(pagingController: _pagingController),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
