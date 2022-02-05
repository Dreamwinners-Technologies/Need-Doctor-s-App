// To parse this JSON data, do
//
//     final researchModel = researchModelFromJson(jsonString);

import 'dart:convert';

List<ResearchDetailsModel> researchDetailsModelFromJson(String str) => List<ResearchDetailsModel>.from(json.decode(str).map((x) => ResearchDetailsModel.fromJson(x)));

String researchDetailsModelToJson(List<ResearchDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchDetailsModel {
  ResearchDetailsModel({
    this.fullName,
    this.journalName,
    this.topic,
    this.publishedOn,
    this.link,
  });

  String fullName;
  String journalName;
  String topic;
  String publishedOn;
  String link;

  factory ResearchDetailsModel.fromJson(Map<String, dynamic> json) => ResearchDetailsModel(
    fullName: json["fullName"],
    journalName: json["journalName"],
    topic: json["topic"],
    publishedOn: json["publishedOn"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "journalName": journalName,
    "topic": topic,
    "publishedOn": publishedOn,
    "link": link,
  };
}
