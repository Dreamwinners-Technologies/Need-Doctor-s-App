import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Constant/color/color.dart';

cameraGallarybtn(BuildContext context, imagepick) {
  return Container(
    color: whitecolor,
    width: MediaQuery.of(context).size.width,
    height: 50.0,
    margin:
        const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Camera
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              imagepick(ImageSource.camera);
            },
            child: Container(
              height: 50.0,
              width: 50.0,
              margin: const EdgeInsets.only(right: 25.0),
              decoration:
                  BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                Icons.add_a_photo,
                color: white,
                size: 26,
              )),
            ),
          ),
        ),
        //Gallary:
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () async {
              imagepick(ImageSource.gallery);
            },
            child: Container(
              height: 50.0, width: 50.0,
              // padding: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                Icons.photo_library,
                color: white,
                size: 25,
              )),
            ),
          ),
        ),
      ],
    ),
  );
}
