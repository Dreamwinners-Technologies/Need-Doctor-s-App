// To parse this JSON data, do
//
//     final prescription = prescriptionFromJson(jsonString);

import 'dart:convert';

List<PrescriptionModel> prescriptionFromJson(String str) => List<PrescriptionModel>.from(json.decode(str).map((x) => PrescriptionModel.fromJson(x)));

String prescriptionToJson(List<PrescriptionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrescriptionModel {
  PrescriptionModel({
    this.drName,
    this.createdOn,
    this.chamberAddress,
    this.medicines,
    this.diseases,
  });

  String drName;
  String createdOn;
  String chamberAddress;
  List<String> medicines;
  List<String> diseases;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => PrescriptionModel(
    drName: json["drName"],
    createdOn: json["createdOn"],
    chamberAddress: json["chamberAddress"],
    medicines: List<String>.from(json["medicines"].map((x) => x)),
    diseases: List<String>.from(json["diseases"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "drName": drName,
    "createdOn": createdOn,
    "chamberAddress": chamberAddress,
    "medicines": List<dynamic>.from(medicines.map((x) => x)),
    "diseases": List<dynamic>.from(diseases.map((x) => x)),
  };
}
