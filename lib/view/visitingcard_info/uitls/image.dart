import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/view/visitingcard_info/uitls/cardimage_view.dart';

cardImage(BuildContext context, String url) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardImageView(url),
          ),
        );
      },
      child: images(context: context, imgUrl: url));
}

images({BuildContext context, String imgUrl}) {
  return Container(
    padding: EdgeInsets.only(top: 8.0),
    margin: EdgeInsets.only(left: 8.0, right: 8.0),
    width: MediaQuery.of(context).size.width,
    height: 210.0,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      // child: Image.network(src),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}
