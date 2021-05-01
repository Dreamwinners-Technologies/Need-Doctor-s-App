import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    this.qualification,
    this.organization,
    this.designation,
    this.phoneNo,
    this.bmdcRegistrationNo,
    this.specialization,
    this.thana,
    this.district,
    this.name,
  });

  dynamic qualification;
  dynamic organization;
  dynamic designation;
  String phoneNo;
  String bmdcRegistrationNo;
  dynamic specialization;
  dynamic thana;
  dynamic district;
  String name;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        qualification: json["qualification"],
        organization: json["organization"],
        designation: json["designation"],
        phoneNo: json["phoneNo"],
        bmdcRegistrationNo: json["bmdcRegistrationNo"],
        specialization: json["specialization"],
        thana: json["thana"],
        district: json["district"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "qualification": qualification,
        "organization": organization,
        "designation": designation,
        "phoneNo": phoneNo,
        "bmdcRegistrationNo": bmdcRegistrationNo,
        "specialization": specialization,
        "thana": thana,
        "district": district,
        "name": name,
      };
}
