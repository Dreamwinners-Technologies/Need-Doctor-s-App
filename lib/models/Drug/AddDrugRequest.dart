
import 'dart:convert';

AddDrugRequest addDrugRequestFromJson(String str) => AddDrugRequest.fromJson(json.decode(str));

String addDrugRequestToJson(AddDrugRequest data) => json.encode(data.toJson());

class AddDrugRequest {
  AddDrugRequest({
    this.administration,
    this.adultDose,
    this.brandName,
    this.childDose,
    this.contraindications,
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

  String administration;
  String adultDose;
  String brandName;
  String childDose;
  String contraindications;
  String generic;
  String indications;
  String interaction;
  String modeOfAction;
  String name;
  String packSize;
  String packSizeAndPrice;
  String precautionsAndWarnings;
  String pregnancyAndLactation;
  String renalDose;
  String sideEffects;
  String therapeuticClass;
  String type;

  factory AddDrugRequest.fromJson(Map<String, dynamic> json) => AddDrugRequest(
    administration: json["administration"],
    adultDose: json["adultDose"],
    brandName: json["brandName"],
    childDose: json["childDose"],
    contraindications: json["contraindications"],
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
