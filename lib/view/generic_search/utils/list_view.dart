import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/text/text.dart';
import 'package:need_doctors/service/NoSQLConfig.dart';
import 'package:need_doctors/view/generic_search/utils/item.dart';

genericItemList(genericList,searchController) {
  NoSQLConfig noSQLConfig = NoSQLConfig();

  return Expanded(
    child: FutureBuilder(
      // future: getGenericList(genericName: searchController.text),
      future: noSQLConfig.getGenerics(searchController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          genericList = snapshot.data;

          return genericList.length > 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: genericList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return genericitem(genericList[index], context);
                  })
              : Center(
                  child: sText("Generic no found", primaryColor, 16.0,
                      FontWeight.normal),
                );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
