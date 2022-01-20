// To parse this JSON data, do
//
//     final publicMedicineRequest = publicMedicineRequestFromJson(jsonString);

import 'dart:convert';

PublicAmbulanceRequest publicAmbulanceRequestFromJson(String str) => PublicAmbulanceRequest.fromJson(json.decode(str));

String publicAmbulanceRequestToJson(PublicAmbulanceRequest data) => json.encode(data.toJson());

class PublicAmbulanceRequest {
  PublicAmbulanceRequest({
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

  factory PublicAmbulanceRequest.fromJson(Map<String, dynamic> json) => PublicAmbulanceRequest(
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
