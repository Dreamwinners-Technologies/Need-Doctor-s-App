// To parse this JSON data, do
//
//     final publicMedicineRequest = publicMedicineRequestFromJson(jsonString);

import 'dart:convert';

PublicMedicineRequest publicMedicineRequestFromJson(String str) => PublicMedicineRequest.fromJson(json.decode(str));

String publicMedicineRequestToJson(PublicMedicineRequest data) => json.encode(data.toJson());

class PublicMedicineRequest {
  PublicMedicineRequest({
    this.administration,
    this.adultDose,
    this.brandName,
    this.childDose,
    this.companyName,
    this.contraIndication,
    this.dose,
    this.form,
    this.genericName,
    this.indication,
    this.interaction,
    this.modeOfAction,
    this.packedSize,
    this.precaution,
    this.pregnanciesCategoryId,
    this.pregnancyCategoryNote,
    this.price,
    this.renalDose,
    this.sideEffect,
    this.strength,
  });

  String administration;
  String adultDose;
  String brandName;
  String childDose;
  String companyName;
  String contraIndication;
  String dose;
  String form;
  String genericName;
  String indication;
  String interaction;
  String modeOfAction;
  String packedSize;
  String precaution;
  int pregnanciesCategoryId;
  String pregnancyCategoryNote;
  String price;
  String renalDose;
  String sideEffect;
  String strength;

  factory PublicMedicineRequest.fromJson(Map<String, dynamic> json) => PublicMedicineRequest(
    administration: json["administration"],
    adultDose: json["adultDose"],
    brandName: json["brandName"],
    childDose: json["childDose"],
    companyName: json["companyName"],
    contraIndication: json["contraIndication"],
    dose: json["dose"],
    form: json["form"],
    genericName: json["genericName"],
    indication: json["indication"],
    interaction: json["interaction"],
    modeOfAction: json["modeOfAction"],
    packedSize: json["packedSize"],
    precaution: json["precaution"],
    pregnanciesCategoryId: json["pregnanciesCategoryId"],
    pregnancyCategoryNote: json["pregnancyCategoryNote"],
    price: json["price"],
    renalDose: json["renalDose"],
    sideEffect: json["sideEffect"],
    strength: json["strength"],
  );

  Map<String, dynamic> toJson() => {
    "administration": administration,
    "adultDose": adultDose,
    "brandName": brandName,
    "childDose": childDose,
    "companyName": companyName,
    "contraIndication": contraIndication,
    "dose": dose,
    "form": form,
    "genericName": genericName,
    "indication": indication,
    "interaction": interaction,
    "modeOfAction": modeOfAction,
    "packedSize": packedSize,
    "precaution": precaution,
    "pregnanciesCategoryId": pregnanciesCategoryId,
    "pregnancyCategoryNote": pregnancyCategoryNote,
    "price": price,
    "renalDose": renalDose,
    "sideEffect": sideEffect,
    "strength": strength,
  };
}
