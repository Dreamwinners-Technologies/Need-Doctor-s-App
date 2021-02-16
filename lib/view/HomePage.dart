import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/models/bannersmodel.dart';

import 'Pagesetup.dart';

final storage = FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  //for Banners:
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  String getsvg = "asset/svg/search_icon.svg";

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Need Doctor"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () async {
              await storage.deleteAll();
              // Navigator.pop(context);
              Navigator.popUntil(context, (route) => route.isFirst);
              //Navigator.push(context, route)
            },
          )
        ],
      ),
      body: FadeAnimation(
        1,
        Container(
          padding: EdgeInsets.only(left: 6.0, bottom: 6.0, top: 4.0),
          child: ListView(
            children: [
              //setBanner
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
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
                            margin: EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.9),
                                image: DecorationImage(
                                    image: AssetImage(banners[index].image),
                                    fit: BoxFit.fill)),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: map<Widget>(
                        banners,
                        (index, image) {
                          return Container(
                            height: 6,
                            margin: EdgeInsets.only(left: 8.0),
                            width: 6,
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
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              //Set Items:
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Items",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    //Row one:
                    Row(
                      children: [
                        homeitemwidget(getsvg, 'Search Medicien', context),
                        homeitemwidget(getsvg, 'Drug by Generic', context),
                        homeitemwidget(getsvg, 'Drug by Deisess', context),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    //Row two:
                    Row(
                      children: [
                        homeitemwidget(getsvg, 'Doctor Card', context),
                        homeitemwidget(getsvg, 'Add Card ', context),
                        homeitemwidget(getsvg, 'Card by area', context),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
