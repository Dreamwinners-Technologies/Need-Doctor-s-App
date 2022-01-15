import 'dart:convert';

AddAmbulanceRequest addAmbulanceRequestFromJson(String str) => AddAmbulanceRequest.fromJson(json.decode(str));

String addAmbulanceRequestToJson(AddAmbulanceRequest data) => json.encode(data.toJson());

class AddAmbulanceRequest {
  AddAmbulanceRequest({
    this.address,
    this.district,
    this.division,
    this.driverName,
    this.phoneNo,
    this.title,
    this.upazila,
  });

  String address;
  String district;
  String division;
  String driverName;
  String phoneNo;
  String title;
  String upazila;

  factory AddAmbulanceRequest.fromJson(Map<String, dynamic> json) => AddAmbulanceRequest(
    address: json["address"],
    district: json["district"],
    division: json["division"],
    driverName: json["driverName"],
    phoneNo: json["phoneNo"],
    title: json["title"],
    upazila: json["upazila"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "district": district,
    "division": division,
    "driverName": driverName,
    "phoneNo": phoneNo,
    "title": title,
    "upazila": upazila,
  };
}
