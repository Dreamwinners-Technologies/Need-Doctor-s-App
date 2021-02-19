
import 'dart:convert';

OwnCardResponse ownCardResponseFromJson(String str) => OwnCardResponse.fromJson(json.decode(str));

String ownCardResponseToJson(OwnCardResponse data) => json.encode(data.toJson());

class OwnCardResponse {
  OwnCardResponse({
    this.id,
    this.addedBy,
    this.name,
    this.appointmentNo,
    this.specialization,
    this.thana,
    this.district,
    this.cardImageUrl,
  });

  String id;
  String addedBy;
  String name;
  String appointmentNo;
  String specialization;
  String thana;
  String district;
  String cardImageUrl;

  factory OwnCardResponse.fromJson(Map<String, dynamic> json) => OwnCardResponse(
    id: json["id"],
    addedBy: json["addedBy"],
    name: json["name"],
    appointmentNo: json["appointmentNo"],
    specialization: json["specialization"],
    thana: json["thana"],
    district: json["district"],
    cardImageUrl: json["cardImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "addedBy": addedBy,
    "name": name,
    "appointmentNo": appointmentNo,
    "specialization": specialization,
    "thana": thana,
    "district": district,
    "cardImageUrl": cardImageUrl,
  };
}
