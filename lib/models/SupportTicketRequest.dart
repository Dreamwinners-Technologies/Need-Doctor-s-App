// To parse this JSON data, do
//
//     final supportTicketRequest = supportTicketRequestFromJson(jsonString);

import 'dart:convert';

SupportTicketRequest supportTicketRequestFromJson(String str) => SupportTicketRequest.fromJson(json.decode(str));

String supportTicketRequestToJson(SupportTicketRequest data) => json.encode(data.toJson());

class SupportTicketRequest {
  SupportTicketRequest({
    this.contactNo,
    this.longDetails,
    this.shortDetails,
  });

  String contactNo;
  String longDetails;
  String shortDetails;

  factory SupportTicketRequest.fromJson(Map<String, dynamic> json) => SupportTicketRequest(
    contactNo: json["contactNo"],
    longDetails: json["longDetails"],
    shortDetails: json["shortDetails"],
  );

  Map<String, dynamic> toJson() => {
    "contactNo": contactNo,
    "longDetails": longDetails,
    "shortDetails": shortDetails,
  };
}
