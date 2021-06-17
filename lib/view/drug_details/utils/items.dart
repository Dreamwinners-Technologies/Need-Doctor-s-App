import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/Constant/text/text.dart';


drugInfoList(String info, String name) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 2.0, color: Color(0xffe7e7e7))),
      child: ConfigurableExpansionTile(
        animatedWidgetFollowingHeader:
            const Icon(Icons.expand_more, color: Colors.black),
        header: Flexible(
            fit: FlexFit.tight,
            child: sText(
                name, blackcolor.withOpacity(0.8), 17.0, FontWeight.bold)),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: mText(
                  info, blackcolor.withOpacity(0.6), 15.0, FontWeight.w600)),
        ],
      ),
    );
  }