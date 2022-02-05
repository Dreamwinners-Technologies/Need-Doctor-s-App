// To parse this JSON data, do
//
//     final researchModel = researchModelFromJson(jsonString);

import 'dart:convert';

List<ResearchModel> researchModelFromJson(String str) => List<ResearchModel>.from(json.decode(str).map((x) => ResearchModel.fromJson(x)));

String researchModelToJson(List<ResearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchModel {
  ResearchModel({
    this.fullName,
    this.journalName,
    this.topic,
    this.publishedOn,
  });

  String fullName;
  String journalName;
  String topic;
  String publishedOn;

  factory ResearchModel.fromJson(Map<String, dynamic> json) => ResearchModel(
    fullName: json["fullName"],
    journalName: json["journalName"],
    topic: json["topic"],
    publishedOn: json["publishedOn"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "journalName": journalName,
    "topic": topic,
    "publishedOn": publishedOn,
  };
}
