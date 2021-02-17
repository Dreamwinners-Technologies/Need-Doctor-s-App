
import 'dart:convert';

DrugListResponse drugListResponseFromJson(String str) => DrugListResponse.fromJson(json.decode(str));

String drugListResponseToJson(DrugListResponse data) => json.encode(data.toJson());

class DrugListResponse {
  DrugListResponse({
    this.drugModelList,
    this.lastPage,
    this.pageNo,
    this.pageSize,
    this.totalItem,
    this.totalPage,
  });

  List<DrugModelList> drugModelList;
  bool lastPage;
  int pageNo;
  int pageSize;
  int totalItem;
  int totalPage;

  factory DrugListResponse.fromJson(Map<String, dynamic> json) => DrugListResponse(
    drugModelList: List<DrugModelList>.from(json["drugModelList"].map((x) => DrugModelList.fromJson(x))),
    lastPage: json["lastPage"],
    pageNo: json["pageNo"],
    pageSize: json["pageSize"],
    totalItem: json["totalItem"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "drugModelList": List<dynamic>.from(drugModelList.map((x) => x.toJson())),
    "lastPage": lastPage,
    "pageNo": pageNo,
    "pageSize": pageSize,
    "totalItem": totalItem,
    "totalPage": totalPage,
  };
}

class DrugModelList {
  DrugModelList({
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

  String administration;
  String adultDose;
  String brandName;
  String childDose;
  String contraindications;
  String drugId;
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

  factory DrugModelList.fromJson(Map<String, dynamic> json) => DrugModelList(
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
