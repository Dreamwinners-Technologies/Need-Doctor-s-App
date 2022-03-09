// To parse this JSON data, do
//
//     final genericsModel = genericsModelFromJson(jsonString);

import 'dart:convert';

GenericsModel genericsModelFromJson(String str) => GenericsModel.fromJson(json.decode(str));

String genericsModelToJson(GenericsModel data) => json.encode(data.toJson());

class GenericsModel {
  GenericsModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int statusCode;
  String message;
  Data data;

  factory GenericsModel.fromJson(Map<String, dynamic> json) => GenericsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.pageSize,
    this.pageNo,
    this.itemCount,
    this.totalItems,
    this.totalPages,
    this.data,
  });

  int pageSize;
  int pageNo;
  int itemCount;
  int totalItems;
  int totalPages;
  List<GenericsData> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pageSize: json["pageSize"],
    pageNo: json["pageNo"],
    itemCount: json["itemCount"],
    totalItems: json["totalItems"],
    totalPages: json["totalPages"],
    data: List<GenericsData>.from(json["data"].map((x) => GenericsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageSize": pageSize,
    "pageNo": pageNo,
    "itemCount": itemCount,
    "totalItems": totalItems,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class GenericsData {
  GenericsData({
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

  int genericId;
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

  factory GenericsData.fromJson(Map<String, dynamic> json) => GenericsData(
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
