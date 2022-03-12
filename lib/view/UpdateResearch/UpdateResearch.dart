import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';
import 'package:need_doctors/networking/UpdateResearchNetwork.dart';
import 'package:need_doctors/view/UpdateResearch/widgets/ResearchCard.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

// ignore: must_be_immutable
class UpdateResearch extends StatefulWidget {
  @override
  State<UpdateResearch> createState() => _UpdateResearchState();
}

class _UpdateResearchState extends State<UpdateResearch> {
  void searchOption() {
    print("search");
  }

  TextEditingController searchController = TextEditingController();

  final _pagingController = PagingController<int, ResearchData>(
    // 2
    firstPageKey: 0,
  );

  @override
  initState() {
    // 3
    print(0);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    print(1);
    try {
      print("search");

      String name = searchController.text;
      print(name + " c");

      // NoSQLConfig noSQLConfig = NoSQLConfig();

      List<ResearchData> researches = [];
      ResearchDetailsModel researchDetailsModel;

      int count;
/*      if (name.length > 1) {

      } else {

      }*/

      researchDetailsModel =
          await searchResearchData(pageSize: 10, pageNo: pageKey);
      researches = researchDetailsModel.data.data;

      bool isLastPage = researchDetailsModel.data.lastPage;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(researches);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(researches, nextPageKey);
      }
      //store.close();
    } catch (error) {
      if (error.toString().contains(
          "Cannot create multiple Store instances for the same directory")) {
        sendToast('Data Sync in Process.Please Wait.');
      }
      print(error);
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
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update Research"),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SearchWidget(
                    searchController: searchController,
                    isWiritten: false,
                    callback: searchOption,
                    searchBoxText: ".",
                  ),
                  Expanded(
                    child: PagedListView.separated(
                      pagingController: _pagingController,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      separatorBuilder: (context, index) => SizedBox(height: 10.0),
                      // itemBuilder: (BuildContext context, int index) {
                      //   return ResearchCard(_pagingController?.itemList[index]);
                      // },
                      builderDelegate: PagedChildBuilderDelegate<ResearchData>(
                        itemBuilder: (context, research, index) {
                          return ResearchCard(research);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SearchWidget(
                    searchController: searchController,
                    isWiritten: false,
                    callback: searchOption,
                    searchBoxText: ".",
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "No New Research Found",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Expanded(
//   child: ListView.builder(
//     padding: const EdgeInsets.all(8),
//     itemCount: researches.length,
//     itemBuilder: (BuildContext context, int index) {
//       return ResearchCard(researches[index]);
//     },
//   ),
// ),
