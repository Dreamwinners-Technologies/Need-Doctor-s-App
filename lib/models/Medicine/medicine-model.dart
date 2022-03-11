// To parse this JSON data, do
//
//     final medicineModel = medicineModelFromJson(jsonString);

import 'dart:convert';

MedicineModel medicineModelFromJson(String str) => MedicineModel.fromJson(json.decode(str));

String medicineModelToJson(MedicineModel data) => json.encode(data.toJson());

class MedicineModel {
  MedicineModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int statusCode;
  String message;
  Data data;

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
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
    this.lastPage,
  });

  int pageSize;
  int pageNo;
  int itemCount;
  int totalItems;
  int totalPages;
  List<MedicineData> data;
  bool lastPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pageSize: json["pageSize"],
    pageNo: json["pageNo"],
    itemCount: json["itemCount"],
    totalItems: json["totalItems"],
    totalPages: json["totalPages"],
    data: List<MedicineData>.from(json["data"].map((x) => MedicineData.fromJson(x))),
    lastPage: json["lastPage"],
  );

  Map<String, dynamic> toJson() => {
    "pageSize": pageSize,
    "pageNo": pageNo,
    "itemCount": itemCount,
    "totalItems": totalItems,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "lastPage": lastPage,
  };
}

class MedicineData {
  MedicineData({
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

  String medicineId;
  String brandName;
  String genericName;
  String companyName;
  String form;
  String strength;
  String price;
  String packedSize;
  int genericId;

  factory MedicineData.fromJson(Map<String, dynamic> json) => MedicineData(
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
