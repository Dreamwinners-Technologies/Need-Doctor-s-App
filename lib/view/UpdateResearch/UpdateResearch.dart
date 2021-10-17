import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:need_doctors/models/StaticData/ResearchDataRaw.dart';
import 'package:need_doctors/models/StaticData/ResearchModel.dart';
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
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: researches.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ResearchCard(researches[index]);
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
