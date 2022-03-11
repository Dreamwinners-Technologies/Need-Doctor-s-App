import 'package:flutter/material.dart';
import 'package:need_doctors/models/ResearchModel/ResearchDetailsModel.dart';

import 'ResearchCardDetails.dart';

// ignore: must_be_immutable
class ResearchDetails extends StatelessWidget {
  ResearchDetails(ResearchDetailsModel research2) {
   this.research2 = research2;
  }

  ResearchDetailsModel research2;

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
                child: ResearchCardDetails(research2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
