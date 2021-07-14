import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/models/bannersmodel.dart';

// ignore: must_be_immutable
class Banners extends StatefulWidget {
  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int _selected = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  child: Swiper(
                    onIndexChanged: (index) {
                      setState(() {
                        _selected = index;
                      });
                    },
                    layout: SwiperLayout.DEFAULT,
                    autoplay: true,
                    autoplayDelay: 8000,
                    itemCount: banners.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 4.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.9),
                          image: DecorationImage(
                            image: AssetImage(banners[index].image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(
                      banners,
                      (index, image) {
                        return Container(
                          height: 10,
                          margin: EdgeInsets.only(left: 8.0),
                          width: 10,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selected == index
                                  ? primaryLight
                                  : primaryColor),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}


