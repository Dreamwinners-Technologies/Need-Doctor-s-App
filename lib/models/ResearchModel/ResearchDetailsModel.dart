// To parse this JSON data, do
//
//     final researchDetailsModel = researchDetailsModelFromJson(jsonString);

import 'dart:convert';

ResearchDetailsModel researchDetailsModelFromJson(String str) => ResearchDetailsModel.fromJson(json.decode(str));

String researchDetailsModelToJson(ResearchDetailsModel data) => json.encode(data.toJson());

class ResearchDetailsModel {
  ResearchDetailsModel({
    this.data,
    this.message,
    this.statusCode,
  });

  Data data;
  String message;
  int statusCode;

  factory ResearchDetailsModel.fromJson(Map<String, dynamic> json) => ResearchDetailsModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "statusCode": statusCode,
  };
}

class Data {
  Data({
    this.data,
    this.itemCount,
    this.lastPage,
    this.pageNo,
    this.pageSize,
    this.totalItems,
    this.totalPages,
  });

  List<ResearchData> data;
  int itemCount;
  bool lastPage;
  int pageNo;
  int pageSize;
  int totalItems;
  int totalPages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<ResearchData>.from(json["data"].map((x) => ResearchData.fromJson(x))),
    itemCount: json["itemCount"],
    lastPage: json["lastPage"],
    pageNo: json["pageNo"],
    pageSize: json["pageSize"],
    totalItems: json["totalItems"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "itemCount": itemCount,
    "lastPage": lastPage,
    "pageNo": pageNo,
    "pageSize": pageSize,
    "totalItems": totalItems,
    "totalPages": totalPages,
  };
}

class ResearchData {
  ResearchData({
    this.abstractText,
    this.author,
    this.createdAt,
    this.createdBy,
    this.headline,
    this.id,
    this.journalName,
    this.link,
    this.publishDate,
    this.updatedAt,
    this.updatedBy,
    this.uuid,
  });

  String abstractText;
  String author;
  int createdAt;
  String createdBy;
  String headline;
  int id;
  String journalName;
  String link;
  String publishDate;
  int updatedAt;
  String updatedBy;
  String uuid;

  factory ResearchData.fromJson(Map<String, dynamic> json) => ResearchData(
    abstractText: json["abstractText"],
    author: json["author"],
    createdAt: json["createdAt"],
    createdBy: json["createdBy"],
    headline: json["headline"],
    id: json["id"],
    journalName: json["journalName"],
    link: json["link"],
    publishDate: json["publishDate"],
    updatedAt: json["updatedAt"],
    updatedBy: json["updatedBy"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "abstractText": abstractText,
    "author": author,
    "createdAt": createdAt,
    "createdBy": createdBy,
    "headline": headline,
    "id": id,
    "journalName": journalName,
    "link": link,
    "publishDate": publishDate,
    "updatedAt": updatedAt,
    "updatedBy": updatedBy,
    "uuid": uuid,
  };
}
