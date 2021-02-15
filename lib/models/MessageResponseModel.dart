import 'dart:convert';

MessageResponseModel messageResponseModelFromJson(String str) =>
    MessageResponseModel.fromJson(json.decode(str));

String messageResponseModelToJson(MessageResponseModel data) =>
    json.encode(data.toJson());

class MessageResponseModel {
  MessageResponseModel({
    this.massage,
  });

  String massage;

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      MessageResponseModel(
        massage: json["massage"],
      );

  Map<String, dynamic> toJson() => {
        "massage": massage,
      };
}
