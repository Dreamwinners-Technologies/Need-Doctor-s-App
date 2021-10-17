// To parse this JSON data, do
//
//     final apiMessageResponse = apiMessageResponseFromJson(jsonString);

import 'dart:convert';

ApiMessageResponse apiMessageResponseFromJson(String str) => ApiMessageResponse.fromJson(json.decode(str));

String apiMessageResponseToJson(ApiMessageResponse data) => json.encode(data.toJson());

class ApiMessageResponse {
  ApiMessageResponse({
    this.message,
    this.statusCode,
  });

  String message;
  int statusCode;

  factory ApiMessageResponse.fromJson(Map<String, dynamic> json) => ApiMessageResponse(
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "statusCode": statusCode,
  };
}
