import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/view/visitingCard/utils/search.dart';

class MedicineByDisease extends StatelessWidget {
  void searchOption() {
    print("search");
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine By Disease"),
      ),
      body: Center(
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
                "Medicine By Disease is Coming Soon",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
