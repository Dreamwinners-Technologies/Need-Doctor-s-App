 import 'package:flutter/material.dart';

Widget fieldItem(
      TextEditingController controller, String title, TextInputType type) {
    return Container(
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(labelText: title),
      ),
    );
  }