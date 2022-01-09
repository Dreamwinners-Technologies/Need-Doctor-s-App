import 'dart:convert';
import 'package:objectbox/objectbox.dart';

ListOfAmbulance listOfAmbulanceFromJson(String str) =>
    ListOfAmbulance.fromJson(json.decode(str));

String listOfAmbulanceToJson(ListOfAmbulance data) =>
    json.encode(data.toJson());

@Entity()
class ListOfAmbulance {
  ListOfAmbulance({
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
  int id;
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

  factory ListOfAmbulance.fromJson(Map<String, dynamic> json) =>
      ListOfAmbulance(
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
