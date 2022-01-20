import 'dart:convert';

GetAmbulanceModel getAmbulanceModelFromJson(String str) =>
    GetAmbulanceModel.fromJson(json.decode(str));

String getAmbulanceModelToJson(GetAmbulanceModel data) =>
    json.encode(data.toJson());

class GetAmbulanceModel {
  GetAmbulanceModel({
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
  List<AmbulanceList> data;
  bool lastPage;

  factory GetAmbulanceModel.fromJson(Map<String, dynamic> json) =>
      GetAmbulanceModel(
        pageSize: json["pageSize"],
        pageNo: json["pageNo"],
        itemCount: json["itemCount"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        data: List<AmbulanceList>.from(
            json["data"].map((x) => AmbulanceList.fromJson(x))),
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

class AmbulanceList {
  AmbulanceList({
    this.uuid,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.driverName,
    this.phoneNo,
    this.title,
    this.division,
    this.district,
    this.upazila,
    this.address,
    this.isApproved,
  });

  String uuid;
  String createdBy;
  int createdAt;
  String updatedBy;
  int updatedAt;
  String driverName;
  String phoneNo;
  String title;
  String division;
  String district;
  String upazila;
  String address;
  bool isApproved;

  factory AmbulanceList.fromJson(Map<String, dynamic> json) => AmbulanceList(
        uuid: json["uuid"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        updatedBy: json["updatedBy"],
        updatedAt: json["updatedAt"],
        driverName: json["driverName"],
        phoneNo: json["phoneNo"],
        title: json["title"],
        division: json["division"],
        district: json["district"],
        upazila: json["upazila"],
        address: json["address"],
        isApproved: json["isApproved"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "updatedBy": updatedBy,
        "updatedAt": updatedAt,
        "driverName": driverName,
        "phoneNo": phoneNo,
        "title": title,
        "division": division,
        "district": district,
        "upazila": upazila,
        "address": address,
        "isApproved": isApproved,
      };
}
