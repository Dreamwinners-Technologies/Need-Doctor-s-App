
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/models/appointment/appointment_list_model.dart';
import 'package:need_doctors/networking/appointment_service/appointment_list_service.dart';
import 'package:need_doctors/view/Prescription/widgets/prescription_list.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInput.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';
import 'package:photo_view/photo_view.dart';

class Prescription extends StatefulWidget {
  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final _pagingController = PagingController<int, AppointmentList>(
    // 2
    firstPageKey: 0,
  );


  void searchOption() {
    print("search");
  }

  TextEditingController searchController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPage = await AppointmentListService().getOwnPriscriptionList(
        pageNo: pageKey,
        pageSize: 30,
      );

      print(newPage.data.data.length);

      // final newPage = await getCardList(pageNo: pageKey, pageSize: 10);

      // ignore: unused_local_variable
      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      final isLastPage = newPage.data.lastPage;
      final newItems = newPage.data.data;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text("Prescription"),
      ),
      body: SingleChildScrollView(

        child: SingleChildScrollView(
      //refresh
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          // 2
          () => _pagingController.refresh(),
        ),
        //body
        
          child: Container(
            child: Column(
              children: [
                SearchWidget(
                  searchController: searchController,
                  isWiritten: false,
                  callback: searchOption,
                ),
              PrescriptionList(pagingController: _pagingController)
              ],
            ),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            sText("Others", whitecolor, 14.0, FontWeight.bold),
          ],
        ),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Others Prescription'),
            // content: const Text('AlertDialog description'),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInput(phoneController, "Phone", "Enter Your Phone",
                        TextInputType.number),
                    CustomInput(pinController, "Pin", "Enter Your Pin",
                        TextInputType.number),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (phoneController.text.isEmpty ||
                      pinController.text.isEmpty) {
                    customDialog(context, "Empty", "Field Connot be Empty",
                        DialogType.ERROR);
                  } else {
                    if (phoneController.text == '018' &&
                        pinController.text == "111") {
                      Navigator.pop(context);
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                              child: PhotoView(
                                  imageProvider:
                                      AssetImage('asset/logog.png'))));

                      setState(() {
                        phoneController.text = "";
                        pinController.text = "";
                      });
                    } else {
                      customDialog(context, "Not Found", "Sorry Not Available",
                          DialogType.ERROR);
                    }
                  }
                },
                child: const Text('Find'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
