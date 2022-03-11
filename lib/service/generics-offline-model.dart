// To parse this JSON data, do
//
//     final genericsOfflineModel = genericsOfflineModelFromJson(jsonString);

import 'dart:convert';

import 'package:objectbox/objectbox.dart';

GenericsOfflineModel genericsOfflineModelFromJson(String str) => GenericsOfflineModel.fromJson(json.decode(str));

String genericsOfflineModelToJson(GenericsOfflineModel data) => json.encode(data.toJson());

@Entity()
class GenericsOfflineModel {
  GenericsOfflineModel({
    this.genericId,
    this.genericName,
    this.precaution,
    this.indication,
    this.contraIndication,
    this.dose,
    this.sideEffect,
    this.pregnanciesCategoryId,
    this.modeOfAction,
    this.interaction,
    this.pregnancyCategoryNote,
    this.adultDose,
    this.childDose,
    this.renalDose,
    this.administration,
  });

  int id;

  @Index()
  int genericId;

  @Index()
  String genericName;
  String precaution;
  String indication;
  String contraIndication;
  String dose;
  String sideEffect;
  int pregnanciesCategoryId;
  String modeOfAction;
  String interaction;
  String pregnancyCategoryNote;
  String adultDose;
  String childDose;
  String renalDose;
  String administration;

  factory GenericsOfflineModel.fromJson(Map<String, dynamic> json) => GenericsOfflineModel(
    genericId: json["genericId"],
    genericName: json["genericName"],
    precaution: json["precaution"],
    indication: json["indication"],
    contraIndication: json["contraIndication"],
    dose: json["dose"],
    sideEffect: json["sideEffect"],
    pregnanciesCategoryId: json["pregnanciesCategoryId"],
    modeOfAction: json["modeOfAction"],
    interaction: json["interaction"],
    pregnancyCategoryNote: json["pregnancyCategoryNote"],
    adultDose: json["adultDose"],
    childDose: json["childDose"],
    renalDose: json["renalDose"],
    administration: json["administration"],
  );

  Map<String, dynamic> toJson() => {
    "genericId": genericId,
    "genericName": genericName,
    "precaution": precaution,
    "indication": indication,
    "contraIndication": contraIndication,
    "dose": dose,
    "sideEffect": sideEffect,
    "pregnanciesCategoryId": pregnanciesCategoryId,
    "modeOfAction": modeOfAction,
    "interaction": interaction,
    "pregnancyCategoryNote": pregnancyCategoryNote,
    "adultDose": adultDose,
    "childDose": childDose,
    "renalDose": renalDose,
    "administration": administration,
  };
}
