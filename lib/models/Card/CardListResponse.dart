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

  List<CardInfoResponseList> cardInfoResponseList;
  bool lastPage;
  int pageNo;
  int pageSize;
  int totalItem;
  int totalPage;

  factory CardListResponse.fromJson(Map<String, dynamic> json) => CardListResponse(
    cardInfoResponseList: List<CardInfoResponseList>.from(json["cardInfoResponseList"].map((x) => CardInfoResponseList.fromJson(x))),
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

class CardInfoResponseList {
  CardInfoResponseList({
    this.addedBy,
    this.appointmentNo,
    this.cardImageUrl,
    this.district,
    this.id,
    this.name,
    this.specialization,
    this.thana,
  });

  String addedBy;
  String appointmentNo;
  String cardImageUrl;
  String district;
  String id;
  String name;
  String specialization;
  String thana;

  factory CardInfoResponseList.fromJson(Map<String, dynamic> json) => CardInfoResponseList(
    addedBy: json["addedBy"],
    appointmentNo: json["appointmentNo"],
    cardImageUrl: json["cardImageUrl"],
    district: json["district"],
    id: json["id"],
    name: json["name"],
    specialization: json["specialization"],
    thana: json["thana"],
  );

  Map<String, dynamic> toJson() => {
    "addedBy": addedBy,
    "appointmentNo": appointmentNo,
    "cardImageUrl": cardImageUrl,
    "district": district,
    "id": id,
    "name": name,
    "specialization": specialization,
    "thana": thana,
  };
}
