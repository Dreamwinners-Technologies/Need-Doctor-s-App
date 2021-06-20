import 'package:flutter/material.dart';
import 'package:need_doctors/view/Home/Widget/HomeWidget.dart';

class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, right: 6.0),
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
                homeItemWidget('asset/svg/search_medicine.svg',
                    'Search Medicine', context),
                homeItemWidget(
                    "asset/svg/doctor.svg", 'Search Doctor', context),
                // homeItemWidget("asset/svg/drugbygereric_icon.svg",
                //     'Drug by Generic', context),
                // homeItemWidget("asset/svg/drugbydeisess_icon.svg",
                //     'Drug by Deisess', context),
                homeItemWidget("asset/svg/ambulance_search.svg",
                    'Search Ambulance', context),
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
                // homeItemWidget("asset/svg/doctorcard_iocn.svg",
                //     'Doctor Card', context),
                homeItemWidget(
                    "asset/svg/vitamin.svg", 'Medicine by Generic', context),
                homeItemWidget(
                    "asset/svg/doctor_icon.svg", 'Login Doctor', context),
                homeItemWidget("asset/svg/medicine_des.svg",
                    'Medicine by Deisess', context),
                // homeItemWidget("asset/svg/addcard_icon.svg",
                //     'Add Own Card', context),
                // homeItemWidget("asset/svg/doctorcard_icon.svg",
                //     'Card by area', context),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // homeItemWidget("asset/svg/adddrug_icon.svg",
                //     'Add Drug', context),
                homeItemWidget("asset/svg/treatment.svg", 'Treatment', context),

                homeItemWidget(
                    "asset/svg/first-aid-kit.svg", 'Treatment Set', context),
                homeItemWidget(
                    "asset/svg/research_med.svg", 'Update Research', context),
                // homeItemWidget("asset/svg/prescription_icon.svg",
                //     'Prescription', context),
                // homeItemWidget("asset/svg/latestdrug_icon.svg",
                //     'Latest Drug', context),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                homeItemWidget(
                    "asset/svg/add_medicine.svg", 'Add Medicine', context),
                homeItemWidget(
                    "asset/svg/wallet.svg", 'Add-Edit Own Card', context),
                homeItemWidget(
                    "asset/svg/ambulance.svg", 'Add Ambulance', context),
                // homeItemWidget(
                //     "asset/svg/lab.svg", 'Latest Research', context),
                // homeItemWidget(
                //     "asset/svg/medical.svg", 'Treatment', context),
                // homeItemWidget(
                //     "asset/svg/ambulance.svg", 'Ambulance', context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
