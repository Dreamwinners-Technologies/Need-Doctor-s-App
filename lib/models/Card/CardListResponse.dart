// To parse this JSON data, do
//
//     final cardListResponse = cardListResponseFromJson(jsonString);

import 'dart:convert';

CardListResponse cardListResponseFromJson(String str) => CardListResponse.fromJson(json.decode(str));

String cardListResponseToJson(CardListResponse data) => json.encode(data.toJson());

class CardListResponse {
  CardListResponse({
    this.cardInfoResponseList,
    this.lastPage,
    this.pageNo,
    this.pageSize,
    this.totalItem,
    this.totalPage,
  });

  List<CardInfoResponse> cardInfoResponseList;
  bool lastPage;
  int pageNo;
  int pageSize;
  int totalItem;
  int totalPage;

  factory CardListResponse.fromJson(Map<String, dynamic> json) => CardListResponse(
    cardInfoResponseList: List<CardInfoResponse>.from(json["cardInfoResponseList"].map((x) => CardInfoResponse.fromJson(x))),
    lastPage: json["lastPage"],
    pageNo: json["pageNo"],
    pageSize: json["pageSize"],
    totalItem: json["totalItem"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "cardInfoResponseList": List<dynamic>.from(cardInfoResponseList.map((x) => x.toJson())),
    "lastPage": lastPage,
    "pageNo": pageNo,
    "pageSize": pageSize,
    "totalItem": totalItem,
    "totalPage": totalPage,
  };
}

class CardInfoResponse {
  CardInfoResponse({
    this.addedBy,
    this.appointmentNo,
    this.cardImageUrl,
    this.cardOcrData,
    this.district,
    this.id,
    this.name,
    this.specialization,
    this.thana,
  });

  String addedBy;
  String appointmentNo;
  String cardImageUrl;
  String cardOcrData;
  String district;
  String id;
  String name;
  List<String> specialization;
  String thana;

  factory CardInfoResponse.fromJson(Map<String, dynamic> json) => CardInfoResponse(
    addedBy: json["addedBy"],
    appointmentNo: json["appointmentNo"],
    cardImageUrl: json["cardImageUrl"],
    cardOcrData: json["cardOcrData"],
    district: json["district"],
    id: json["id"],
    name: json["name"],
    specialization: List<String>.from(json["specialization"].map((x) => x)),
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "addedBy": addedBy,
    "appointmentNo": appointmentNo,
    "cardImageUrl": cardImageUrl,
    "cardOcrData": cardOcrData,
    "district": district,
    "id": id,
    "name": name,
    "specialization": List<dynamic>.from(specialization.map((x) => x)),
    "thana": thana,
  };
}
