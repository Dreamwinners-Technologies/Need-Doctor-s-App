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
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Research"),
      ),
      body: Center(
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
    );
  }
}

