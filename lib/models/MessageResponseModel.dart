import 'dart:convert';

MessageResponseModel messageResponseModelFromJson(String str) => MessageResponseModel.fromJson(json.decode(str));

String messageResponseModelToJson(MessageResponseModel data) => json.encode(data.toJson());

class MessageResponseModel {
  MessageResponseModel({
    this.message,
  });

  String message;

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) => MessageResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
