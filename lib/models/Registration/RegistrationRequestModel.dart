// To parse this JSON data, do
//
//     final registrationRequestModel = registrationRequestModelFromJson(jsonString);


import 'dart:convert';

RegistrationRequestModel registrationRequestModelFromJson(String str) => RegistrationRequestModel.fromJson(json.decode(str));

String registrationRequestModelToJson(RegistrationRequestModel data) => json.encode(data.toJson());

class RegistrationRequestModel {
  RegistrationRequestModel({
    this.bmdcRegistrationNo,
    this.district,
    this.email,
    this.name,
    this.organization,
    this.phoneNo,
    this.role,
    this.specialization,
    this.thana,
  });

  String bmdcRegistrationNo;
  String district;
  String email;
  String name;
  String organization;
  String phoneNo;
  List<String> role;
  String specialization;
  String thana;

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) => RegistrationRequestModel(
    bmdcRegistrationNo: json["bmdcRegistrationNo"],
    district: json["district"],
    email: json["email"],
    name: json["name"],
    organization: json["organization"],
    phoneNo: json["phoneNo"],
    role: List<String>.from(json["role"].map((x) => x)),
    specialization: json["specialization"],
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "bmdcRegistrationNo": bmdcRegistrationNo,
    "district": district,
    "email": email,
    "name": name,
    "organization": organization,
    "phoneNo": phoneNo,
    "role": List<dynamic>.from(role.map((x) => x)),
    "specialization": specialization,
    "thana": thana,
  };
}
