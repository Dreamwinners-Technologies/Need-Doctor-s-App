// To parse this JSON data, do
//
//     final medicineOfflineModel = medicineOfflineModelFromJson(jsonString);

import 'dart:convert';

import 'package:objectbox/objectbox.dart';

List<MedicineOfflineModel> medicineOfflineModelFromJson(String str) => List<MedicineOfflineModel>.from(json.decode(str).map((x) => MedicineOfflineModel.fromJson(x)));

String medicineOfflineModelToJson(List<MedicineOfflineModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@Entity()
class MedicineOfflineModel {
  MedicineOfflineModel({
    this.medicineId,
    this.brandName,
    this.genericName,
    this.companyName,
    this.form,
    this.strength,
    this.price,
    this.packedSize,
    this.genericId,
  });

  int id;

  String medicineId;

  @Index()
  String brandName;

  @Index()
  String genericName;

  @Index()
  String companyName;

  String form;
  String strength;
  String price;
  String packedSize;
  int genericId;

  factory MedicineOfflineModel.fromJson(Map<String, dynamic> json) => MedicineOfflineModel(
    medicineId: json["medicineId"],
    brandName: json["brandName"],
    genericName: json["genericName"],
    companyName: json["companyName"],
    form: json["form"],
    strength: json["strength"],
    price: json["price"],
    packedSize: json["packedSize"],
    genericId: json["genericId"],
  );

  Map<String, dynamic> toJson() => {
    "medicineId": medicineId,
    "brandName": brandName,
    "genericName": genericName,
    "companyName": companyName,
    "form": form,
    "strength": strength,
    "price": price,
    "packedSize": packedSize,
    "genericId": genericId,
  };
}
