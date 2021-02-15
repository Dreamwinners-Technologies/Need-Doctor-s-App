import 'dart:convert';

RegistrationRequestModel registrationRequestModelFromJson(String str) =>
    RegistrationRequestModel.fromJson(json.decode(str));

String registrationRequestModelToJson(RegistrationRequestModel data) =>
    json.encode(data.toJson());

class RegistrationRequestModel {
  RegistrationRequestModel({
    this.bmdcRegistrationNo,
    this.district,
    this.name,
    this.phoneNo,
    this.role,
    this.specialization,
    this.thana,
  });

  String bmdcRegistrationNo;
  String district;
  String name;
  String phoneNo;
  List<String> role;
  String specialization;
  String thana;

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) =>
      RegistrationRequestModel(
        bmdcRegistrationNo: json["bmdcRegistrationNo"],
        district: json["district"],
        name: json["name"],
        phoneNo: json["phoneNo"],
        role: List<String>.from(json["role"].map((x) => x)),
        specialization: json["specialization"],
        thana: json["thana"],
      );

  Map<String, dynamic> toJson() => {
        "bmdcRegistrationNo": bmdcRegistrationNo,
        "district": district,
        "name": name,
        "phoneNo": phoneNo,
        "role": List<dynamic>.from(role.map((x) => x)),
        "specialization": specialization,
        "thana": thana,
      };
}
