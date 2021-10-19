// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.bmdcRegistrationNo,
    this.designation,
    this.district,
    this.email,
    this.name,
    this.organization,
    this.phoneNo,
    this.pinNo,
    this.qualification,
    this.specialization,
    this.thana,
  });

  String bmdcRegistrationNo;
  String designation;
  String district;
  String email;
  String name;
  String organization;
  String phoneNo;
  int pinNo;
  String qualification;
  String specialization;
  String thana;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    bmdcRegistrationNo: json["bmdcRegistrationNo"],
    designation: json["designation"],
    district: json["district"],
    email: json["email"],
    name: json["name"],
    organization: json["organization"],
    phoneNo: json["phoneNo"],
    pinNo: json["pinNo"],
    qualification: json["qualification"],
    specialization: json["specialization"],
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "bmdcRegistrationNo": bmdcRegistrationNo,
    "designation": designation,
    "district": district,
    "email": email,
    "name": name,
    "organization": organization,
    "phoneNo": phoneNo,
    "pinNo": pinNo,
    "qualification": qualification,
    "specialization": specialization,
    "thana": thana,
  };
}
