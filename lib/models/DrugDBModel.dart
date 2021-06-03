// To parse this JSON data, do
//
//     final drugDbModel = drugDbModelFromJson(jsonString);

import 'dart:convert';

List<DrugDbModel> drugDbModelFromJson(String str) => List<DrugDbModel>.from(json.decode(str).map((x) => DrugDbModel.fromJson(x)));

String drugDbModelToJson(List<DrugDbModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrugDbModel {
  DrugDbModel({
    this.brandId,
    this.genericId,
    this.companyId,
    this.brandName,
    this.form,
    this.strength,
    this.price,
    this.packsize,
    this.companyName,
    this.genericName,
    this.precaution,
    this.indication,
    this.contraIndication,
    this.sideEffect,
    this.pregnancyCategoryId,
    this.modeOfAction,
    this.interaction,
    this.pregnancyCategoryNote,
    this.adultDose,
    this.childDose,
    this.renalDose,
    this.administration,
  });

  String brandId;
  String genericId;
  String companyId;
  String brandName;
  String form;
  String strength;
  String price;
  String packsize;
  String companyName;
  String genericName;
  String precaution;
  String indication;
  String contraIndication;
  String sideEffect;
  String pregnancyCategoryId;
  String modeOfAction;
  String interaction;
  String pregnancyCategoryNote;
  String adultDose;
  String childDose;
  String renalDose;
  String administration;

  factory DrugDbModel.fromJson(Map<String, dynamic> json) => DrugDbModel(
    brandId: json["brand_id"].toString(),
    genericId: json["generic_id"].toString(),
    companyId: json["company_id"].toString(),
    brandName: json["brand_name"].toString(),
    form: json["form"].toString(),
    strength: json["strength"].toString(),
    price: json["price"].toString(),
    packsize: json["packsize"].toString(),
    companyName: json["company_name"].toString(),
    genericName: json["generic_name"].toString(),
    precaution: json["precaution"].toString(),
    indication: json["indication"].toString(),
    contraIndication: json["contra_indication"].toString(),
    sideEffect: json["side_effect"].toString(),
    pregnancyCategoryId: json["pregnancy_category_id"].toString(),
    modeOfAction: json["mode_of_action"].toString(),
    interaction: json["interaction"].toString(),
    pregnancyCategoryNote: json["pregnancy_category_note"].toString(),
    adultDose: json["adult_dose"].toString(),
    childDose: json["child_dose"].toString(),
    renalDose: json["renal_dose"].toString(),
    administration: json["administration"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "brand_id": brandId,
    "generic_id": genericId,
    "company_id": companyId,
    "brand_name": brandName,
    "form": form,
    "strength": strength,
    "price": price,
    "packsize": packsize,
    "company_name": companyName,
    "generic_name": genericName,
    "precaution": precaution,
    "indication": indication,
    "contra_indication": contraIndication,
    "side_effect": sideEffect,
    "pregnancy_category_id": pregnancyCategoryId,
    "mode_of_action": modeOfAction,
    "interaction": interaction,
    "pregnancy_category_note": pregnancyCategoryNote,
    "adult_dose": adultDose,
    "child_dose": childDose,
    "renal_dose": renalDose,
    "administration": administration,
  };
}
