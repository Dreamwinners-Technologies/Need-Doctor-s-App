import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/Constant/widgets/bottomsheet.dart';
import 'package:need_doctors/Constant/widgets/dialog.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:need_doctors/networking/prescription/others_prescription_service.dart';
import 'package:need_doctors/view/Prescription/widgets/prescription_list.dart';
import 'package:need_doctors/view/Treatment/widgets/CustomInput.dart';
import 'package:lottie/lottie.dart';

class OthersPrescription extends StatefulWidget {
  const OthersPrescription({Key key}) : super(key: key);

  @override
  _OthersPrescriptionState createState() => _OthersPrescriptionState();
}

class _OthersPrescriptionState extends State<OthersPrescription> {
  final _pagingController = PagingController<int, Datum>(
    // 2
    firstPageKey: 0,
  );
  bool isFirstTime = true;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    print(phoneController.text);
    try {
      final newPage = await getOthersPrescriptionList(
        pinNo: pinController.text.isEmpty ? 0 : int.parse(pinController.text),
        phoneNo: phoneController.text.toString(),
        pageNo: pageKey,
        pageSize: 30,
      );

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

  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                PrescriptionList(pagingController: _pagingController),
                isFirstTime
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset('asset/lottie/presciption_lottie.json',
                                fit: BoxFit.contain),
                            sText("Please Attempt Now", blackcolor, 23.0,
                                FontWeight.bold)
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(25.0)),
                        width: double.infinity,
                      )
                    : Container()
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Row(
            children: [
              sText("Attempt", whitecolor, 14.0, FontWeight.bold),
            ],
          ),
          onPressed: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => SizedBox(
                      height: 300.0,
                      child: AlertDialog(
                        title: Text('Others Prescription'),
                        // content: const Text('AlertDialog description'),
                        content: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomInput(phoneController, "Phone",
                                    "Enter Your Phone", TextInputType.number),
                                CustomInput(pinController, "Pin",
                                    "Enter Your Pin", TextInputType.number),
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
                                customDialog(context, "Empty",
                                    "Field Connot be Empty", DialogType.ERROR);
                              } else {
                                sendToast("Please Wait...");
                                print('object');

                                _pagingController.refresh();

                                setState(() {
                                  isFirstTime = false;
                                });
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Find'),
                          ),
                        ],
                      ),
                    ));
          }),
    );
  }
}
