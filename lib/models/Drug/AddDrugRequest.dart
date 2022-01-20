
import 'dart:convert';

AddDrugRequest addDrugRequestFromJson(String str) => AddDrugRequest.fromJson(json.decode(str));

String addDrugRequestToJson(AddDrugRequest data) => json.encode(data.toJson());

class AddDrugRequest {
  AddDrugRequest({
    this.thana,
    this.district,
    this.title,
    this.childDose,
    this.contraindications,
    this.phone,
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

  String thana;
  String district;
  String title;
  String childDose;
  String contraindications;
  String phone;
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
    thana: json["administration"],
    district: json["adultDose"],
    title: json["brandName"],
    childDose: json["childDose"],
    contraindications: json["contraindications"],
    phone: json["generic"],
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
    "administration": thana,
    "adultDose": district,
    "brandName": title,
    "childDose": childDose,
    "contraindications": contraindications,
    "generic": phone,
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
