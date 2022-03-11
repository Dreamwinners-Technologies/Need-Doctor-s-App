import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDataRaw.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';
import 'package:need_doctors/models/ResearchModel/ResearchModel.dart';
import 'package:need_doctors/view/UpdateResearch/widgets/ResearchCard.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

// ignore: must_be_immutable
class UpdateResearch extends StatelessWidget {
  UpdateResearch();

  void searchOption() {
    print("search");
  }

  TextEditingController searchController = TextEditingController();

  List<ResearchModel> researches = researchModelFromJson(json.encode(researchDataRaw));
  List<ResearchDetailsModel> researche2 = researchDetailsModelFromJson(json.encode(researchDataRaw));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update Research"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Old Research",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "New Research",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
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
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: researches.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ResearchCard(researches[index],researche2[index]);
                      },
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
