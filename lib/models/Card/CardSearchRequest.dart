import 'dart:convert';

CardSearchRequest cardSearchRequestFromJson(String str) => CardSearchRequest.fromJson(json.decode(str));

String cardSearchRequestToJson(CardSearchRequest data) => json.encode(data.toJson());

class CardSearchRequest {
  CardSearchRequest({
    this.district,
    this.name,
    this.specialization,
    this.thana,
  });

  String district;
  String name;
  String specialization;
  String thana;

  factory CardSearchRequest.fromJson(Map<String, dynamic> json) => CardSearchRequest(
    district: json["district"],
    name: json["name"],
    specialization: json["specialization"],
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "district": district,
    "name": name,
    "specialization": specialization,
    "thana": thana,
  };
}
