// To parse this JSON data, do
//
//     final dragDetails = dragDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'DrugDetails.g.dart';


DrugDetails dragDetailsFromJson(String str) => DrugDetails.fromJson(json.decode(str));

String dragDetailsToJson(DrugDetails data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class DrugDetails {

  DrugDetails({
    this.administration,
    this.adultDose,
    this.brandName,
    this.childDose,
    this.contraindications,
    this.drugId,
    this.generic,
    this.indications,
    this.interaction,
    this.modeOfAction,
    this.name,
    this.packSize,
    this.packSizeAndPrice,
    this.precautionsAndWarnings,
    this.pregnancyAndLactation,
    this.renalDose,
    this.sideEffects,
    this.therapeuticClass,
    this.type,
  });

  @HiveField(0)
  String administration;

  @HiveField(1)
  String adultDose;

  @HiveField(2)
  String brandName;

  @HiveField(3)
  String childDose;

  @HiveField(4)
  String contraindications;

  @HiveField(5)
  String drugId;

  @HiveField(6)
  String generic;

  @HiveField(7)
  String indications;

  @HiveField(8)
  String interaction;

  @HiveField(9)
  String modeOfAction;

  @HiveField(10)
  String name;

  @HiveField(11)
  String packSize;

  @HiveField(12)
  String packSizeAndPrice;

  @HiveField(13)
  String precautionsAndWarnings;

  @HiveField(14)
  String pregnancyAndLactation;

  @HiveField(15)
  String renalDose;

  @HiveField(16)
  String sideEffects;

  @HiveField(17)
  String therapeuticClass;

  @HiveField(18)
  String type;

  factory DrugDetails.fromJson(Map<String, dynamic> json) => DrugDetails(
    administration: json["administration"],
    adultDose: json["adultDose"],
    brandName: json["brandName"],
    childDose: json["childDose"],
    contraindications: json["contraindications"],
    drugId: json["drugId"],
    generic: json["generic"],
    indications: json["indications"],
    interaction: json["interaction"],
    modeOfAction: json["modeOfAction"],
    name: json["name"],
    packSize: json["packSize"],
    packSizeAndPrice: json["packSizeAndPrice"],
    precautionsAndWarnings: json["precautionsAndWarnings"],
    pregnancyAndLactation: json["pregnancyAndLactation"],
    renalDose: json["renalDose"],
    sideEffects: json["sideEffects"],
    therapeuticClass: json["therapeuticClass"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "administration": administration,
    "adultDose": adultDose,
    "brandName": brandName,
    "childDose": childDose,
    "contraindications": contraindications,
    "drugId": drugId,
    "generic": generic,
    "indications": indications,
    "interaction": interaction,
    "modeOfAction": modeOfAction,
    "name": name,
    "packSize": packSize,
    "packSizeAndPrice": packSizeAndPrice,
    "precautionsAndWarnings": precautionsAndWarnings,
    "pregnancyAndLactation": pregnancyAndLactation,
    "renalDose": renalDose,
    "sideEffects": sideEffects,
    "therapeuticClass": therapeuticClass,
    "type": type,
  };
}
