import 'dart:convert';

AddCardRequest addCardRequestFromJson(String str) =>
    AddCardRequest.fromJson(json.decode(str));

String addCardRequestToJson(AddCardRequest data) => json.encode(data.toJson());

class AddCardRequest {
  AddCardRequest({
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

  factory AddCardRequest.fromJson(Map<String, dynamic> json) => AddCardRequest(
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
