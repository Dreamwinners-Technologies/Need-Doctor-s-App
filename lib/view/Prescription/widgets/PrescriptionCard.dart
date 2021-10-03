import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';
import 'package:need_doctors/models/StaticData/PrescriptionModel.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class PrescriptionCard extends StatelessWidget {
  PrescriptionCard(PrescriptionModel prescriptionModel) {
    this.prescriptionModel = prescriptionModel;
  }

  PrescriptionModel prescriptionModel = PrescriptionModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Container(
                  child:
                      PhotoView(imageProvider: AssetImage('asset/logog.png')))
              //  AlertDialog(
              //   title: Text('Prescription'),
              //   // content: const Text('AlertDialog description'),
              //   content: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Text('Diseases', style: TextStyle(fontSize: 18)),
              //       Container(
              //         height: MediaQuery.of(context).size.height * .20,
              //         width: 300.0,
              //         child: ListView.builder(
              //           padding: const EdgeInsets.all(8),
              //           itemCount: prescriptionModel.diseases.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Container(
              //               margin: EdgeInsets.symmetric(vertical: 5.0),
              //               child: Text(
              //                 (index + 1).toString() + ". " + prescriptionModel.diseases[index],
              //                 style: TextStyle(fontSize: 15),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //       Text('Medicine', style: TextStyle(fontSize: 18)),
              //       Container(
              //         height: MediaQuery.of(context).size.height * .35,
              //         width: MediaQuery.of(context).size.width * .95,
              //         child: ListView.builder(
              //           padding: const EdgeInsets.all(8),
              //           itemCount: prescriptionModel.medicines.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Container(
              //               margin: EdgeInsets.symmetric(vertical: 5.0),
              //               child: Text(
              //                 (index + 1).toString() + ". " + prescriptionModel.medicines[index],
              //                 style: TextStyle(fontSize: 15),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              //   actions: <Widget>[
              //     TextButton(
              //       onPressed: () => Navigator.pop(context, 'Close'),
              //       child: const Text('Close'),
              //     ),
              //     // TextButton(
              //     //   onPressed: () => Navigator.pop(context, 'Find'),
              //     //   child: const Text('Find'),
              //     // ),
              //   ],
              // ),
              ),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dr. Name: " + prescriptionModel.drName,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "Visited On: " + prescriptionModel.createdOn,
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "Address: " + prescriptionModel.chamberAddress,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: primarycolor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
