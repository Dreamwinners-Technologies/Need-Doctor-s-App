// To parse this JSON data, do
//
//     final cardListResponse = cardListResponseFromJson(jsonString);

import 'dart:convert';
import 'package:objectbox/objectbox.dart';

CardInfoResponseList cardListResponseFromJson(String str) =>
    CardInfoResponseList.fromJson(json.decode(str));

String cardListResponseToJson(CardInfoResponseList data) =>
    json.encode(data.toJson());

@Entity()
class CardInfoResponseList {
  CardInfoResponseList(
      {this.addedBy,
      this.appointmentNo,
      this.cardImageUrl,
      this.cardOcrData,
      this.district,
      this.cardid,
      this.name,
      this.nameSearch,
      this.specialization,
      this.thana,
      this.specializationString});
  int id;
  String addedBy;
  String appointmentNo;
  String cardImageUrl;
  String cardOcrData;
  String district;
  String cardid;
  String name;
  String nameSearch;
  List<String> specialization;
  String specializationString;
  String thana;

  factory CardInfoResponseList.fromJson(Map<String, dynamic> json) =>
      CardInfoResponseList(
        addedBy: json["addedBy"],
        appointmentNo: json["appointmentNo"],
        cardImageUrl: json["cardImageUrl"],
        cardOcrData: json["cardOcrData"],
        district: json["district"],
        cardid: json["id"],
        name: json["name"],
        nameSearch: json["nameSearch"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        specializationString: json['specializationString'],
        thana: json["thana"],
      );

  Map<String, dynamic> toJson() => {
        "addedBy": addedBy,
        "appointmentNo": appointmentNo,
        "cardImageUrl": cardImageUrl,
        "cardOcrData": cardOcrData,
        "district": district,
        "id": cardid,
        "name": name,
        'nameSearch': nameSearch,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        'specializationString': specializationString,
        "thana": thana,
      };
}
