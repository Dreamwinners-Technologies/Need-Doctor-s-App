import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/org_data/text_style.dart';

headerArea() {
  return Container(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    color: primaryColor,
    width: double.infinity,
    child: Column(
      children: [
        Container(
          color: primaryColor,
          padding: const EdgeInsets.only(left: 5.0, right: 12.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: Image.asset("asset/Avatar1.png"),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                    child: drnametext,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 5.0),
                    child: phonetext,
                    )
                ],
                )
            ],
            ),
          )
      ],
      ),
    );
}
