// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
import 'dart:convert';

UserNetworkHolder userModelFromJson(String str) => UserNetworkHolder.fromJson(json.decode(str));

String userModelToJson(UserNetworkHolder data) => json.encode(data.toJson());

class UserNetworkHolder {
  UserNetworkHolder({
    this.bmdcRegistrationNo,
    this.designation,
    this.district,
    this.name,
    this.organization,
    this.phoneNo,
    this.qualification,
    this.specialization,
    this.thana,
  });

  String bmdcRegistrationNo;
  String designation;
  String district;
  String name;
  String organization;
  String phoneNo;
  String qualification;
  String specialization;
  String thana;

  factory UserNetworkHolder.fromJson(Map<String, dynamic> json) => UserNetworkHolder(
    bmdcRegistrationNo: json["bmdcRegistrationNo"],
    designation: json["designation"],
    district: json["district"],
    name: json["name"],
    organization: json["organization"],
    phoneNo: json["phoneNo"],
    qualification: json["qualification"],
    specialization: json["specialization"],
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "bmdcRegistrationNo": bmdcRegistrationNo,
    "designation": designation,
    "district": district,
    "name": name,
    "organization": organization,
    "phoneNo": phoneNo,
    "qualification": qualification,
    "specialization": specialization,
    "thana": thana,
  };
}
