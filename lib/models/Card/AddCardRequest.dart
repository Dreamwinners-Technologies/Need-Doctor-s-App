import 'dart:convert';

AddCardRequest addCardRequestFromJson(String str) => AddCardRequest.fromJson(json.decode(str));

String addCardRequestToJson(AddCardRequest data) => json.encode(data.toJson());

class AddCardRequest {
  AddCardRequest({
    this.appointmentNo,
    this.cardOcrData,
    this.district,
    this.name,
    this.specializations,
    this.thana,
  });

  String appointmentNo;
  String cardOcrData;
  String district;
  String name;
  List<String> specializations;
  String thana;

  factory AddCardRequest.fromJson(Map<String, dynamic> json) => AddCardRequest(
    appointmentNo: json["appointmentNo"],
    cardOcrData: json["cardOcrData"],
    district: json["district"],
    name: json["name"],
    specializations: List<String>.from(json["specializations"].map((x) => x)),
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentNo": appointmentNo,
    "cardOcrData": cardOcrData,
    "district": district,
    "name": name,
    "specializations": List<dynamic>.from(specializations.map((x) => x)),
    "thana": thana,
  };
}

