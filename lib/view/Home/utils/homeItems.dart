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
                Hero(
                  tag: 'medicine',
                  child: homeItemWidget(
                      'asset/home/search.svg', 'Search Medicine', context),
                ),
                Hero(
                    tag: 'doctor',
                    child: homeItemWidget(
                        "asset/svg/doctor.svg", 'Search Doctor', context)),
                homeItemWidget(
                    "asset/svg/ambulance.svg", 'Search Ambulance', context),
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
                Hero(
                    tag: 'generic',
                    child: homeItemWidget("asset/home/vitamin.svg",
                        'Medicine by Generic', context)),
                homeItemWidget(

                    "asset/home/doctor_icon.svg", 'Appointment', context),
                homeItemWidget("asset/home/medicine_des.svg",
                    'Medicine by Disease', context),
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
                homeItemWidget(
                    "asset/home/treatment.svg", 'Treatment', context),
                homeItemWidget(
                    "asset/home/research_med.svg", 'Update Research', context),
                homeItemWidget(
                    "asset/home/prescription.svg", 'Prescriptions', context),
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
                    "asset/home/add_medicine.svg", 'Add Medicine', context),
                homeItemWidget(
                    "asset/home/wallet.svg", 'Add Card', context),
                homeItemWidget(
                    "asset/home/ambulance (1).svg", 'Add Ambulance', context),
                // homeItemWidget(
                //     "asset/svg/lab.svg", 'Latest Research', context),
                // homeItemWidget(
                //     "asset/svg/medical.svg", 'Treatment', context),
                // homeItemWidget(
                //     "asset/svg/ambulance.svg", 'Ambulance', context),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       homeItemWidget(
          //           "asset/home/research_med.svg", 'Update Research', context),
          //       homeItemWidget(
          //           "asset/home/addmed.svg", 'Add Medicine', context),
          //       homeItemWidget(
          //           "asset/home/smartphone.svg", 'About App', context),
          //       // homeItemWidget(
          //       //     "asset/svg/lab.svg", 'Latest Research', context),
          //       // homeItemWidget(
          //       //     "asset/svg/medical.svg", 'Treatment', context),
          //       // homeItemWidget(
          //       //     "asset/svg/ambulance.svg", 'Ambulance', context),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
