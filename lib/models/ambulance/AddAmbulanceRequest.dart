
import 'dart:convert';

AddAmbulanceRequest addAmbulanceRequestFromJson(String str) => AddAmbulanceRequest.fromJson(json.decode(str));

String addAmbulanceRequestToJson(AddAmbulanceRequest data) => json.encode(data.toJson());

class AddAmbulanceRequest {
  AddAmbulanceRequest({
    this.name,
    this.phone,
    this.title,
    this.division,
    this.district,
    this.thana,
  });

  String name;
  String phone;
  String title;
  String division;
  String district;
  String thana;

  factory AddAmbulanceRequest.fromJson(Map<String, dynamic> json) =>
      AddAmbulanceRequest(
        name: json["name"],
        phone: json["phone"],
        title: json["title"],
        division: json["division"],
        district: json["district"],
        thana: json["thana"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "phone": phone,
        "title": title,
        "division": division,
        "district": district,
        "thana": thana,
      };
}

  class AmbulanceModelList {
  AmbulanceModelList({
  this.name,
  this.phone,
  this.title,
  this.division,
  this.district,
  this.thana,
  });

  String name;
  String phone;
  String title;
  String division;
  String district;
  String thana;

  factory AmbulanceModelList.fromJson(Map<String, dynamic> json) => AmbulanceModelList(
  name: json["name"],
  phone: json["phone"],
  title: json["title"],
  division: json["division"],
  district: json["district"],
  thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
  "name": name,
  "phone": phone,
  "title": title,
  "division": division,
  "district": district,
  "thana": thana,
  };
  }
