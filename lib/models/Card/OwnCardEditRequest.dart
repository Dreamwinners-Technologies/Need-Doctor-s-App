
import 'dart:convert';

OwnCardEditRequest ownCardEditRequestFromJson(String str) => OwnCardEditRequest.fromJson(json.decode(str));

String ownCardEditRequestToJson(OwnCardEditRequest data) => json.encode(data.toJson());

class OwnCardEditRequest {
  OwnCardEditRequest({
    this.appointmentNo,
    this.district,
    this.name,
    this.specialization,
    this.thana,
  });

  String appointmentNo;
  String district;
  String name;
  String specialization;
  String thana;

  factory OwnCardEditRequest.fromJson(Map<String, dynamic> json) => OwnCardEditRequest(
    appointmentNo: json["appointmentNo"],
    district: json["district"],
    name: json["name"],
    specialization: json["specialization"],
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentNo": appointmentNo,
    "district": district,
    "name": name,
    "specialization": specialization,
    "thana": thana,
  };
}
