import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/models/bannersmodel.dart';

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
          padding:
              EdgeInsets.only(left: 6.0, bottom: 6.0, top: 4.0, right: 6.0),
          child: ListView(
            children: [
              //setBanner
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
                            margin: const EdgeInsets.only(right: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.9),
                              image: DecorationImage(
                                  image: AssetImage(banners[index].image),
                                  fit: BoxFit.fill),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
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
                    ),
                  ],
                ),
              ),
              //Set Items:
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 15.0),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Row one:
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          homeitemwidget(getsvg, 'Search Medicien', context),
                          homeitemwidget("asset/svg/drugbygereric_icon.svg",
                              'Drug by Generic', context),
                          homeitemwidget("asset/svg/drugbydeisess_icon.svg",
                              'Drug by Deisess', context),
                        ],
                      ),
                    ),
                    //Row two:
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          homeitemwidget("asset/svg/doctorcard_iocn.svg",
                              'Doctor Card', context),
                          homeitemwidget("asset/svg/addcard_icon.svg",
                              'Add Card', context),
                          homeitemwidget("asset/svg/doctorcard_icon.svg",
                              'Card by area', context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          homeitemwidget("asset/svg/adddrug_icon.svg",
                              'Add Drug', context),
                          homeitemwidget("asset/svg/prescription_icon.svg",
                              'Prescription', context),
                          homeitemwidget("asset/svg/latestdrug_icon.svg",
                              'Latest Drug', context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
