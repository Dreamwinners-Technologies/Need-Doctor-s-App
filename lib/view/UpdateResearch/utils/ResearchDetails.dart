import 'package:flutter/material.dart';
import 'package:need_doctors/models/StaticData/ResearchModel.dart';
import 'package:need_doctors/view/UpdateResearch/utils/ResearchCardDetails.dart';

// ignore: must_be_immutable
class ResearchDetails extends StatelessWidget {
  ResearchDetails(ResearchModel research) {
   this.research = research;
  }

  ResearchModel research;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Research"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: ResearchCardDetails(research),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
