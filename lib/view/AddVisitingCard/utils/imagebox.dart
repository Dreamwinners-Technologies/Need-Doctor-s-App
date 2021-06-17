import 'package:flutter/material.dart';

imageBox(_image, BuildContext context) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.only(top: 13.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1.0, color: Color(0xffe7e7e7))),
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width * .92,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: _image != null
              ? Image.file(
                  _image,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * .9,
                ),
        ),
      ),

      Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width * .9,
        margin: EdgeInsetsDirectional.only(
            top: (MediaQuery.of(context).size.height / 6) / 2.5),
        alignment: Alignment.center,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Visibility(
                visible: _image == null ? true : false,
                child: Image.asset("asset/images/Noimage.jpg"))),
      ),
      // )
    ],
  );
}
