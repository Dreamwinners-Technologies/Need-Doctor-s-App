
import 'dart:convert';

MessageIdResponse messageIdResponseFromJson(String str) => MessageIdResponse.fromJson(json.decode(str));

String messageIdResponseToJson(MessageIdResponse data) => json.encode(data.toJson());

class MessageIdResponse {
  MessageIdResponse({
    this.id,
    this.message,
  });

  String id;
  String message;

  factory MessageIdResponse.fromJson(Map<String, dynamic> json) => MessageIdResponse(
    id: json["id"],
    message: json["message"],
  );

  bool get notnull   => null;

  Map<String, dynamic> toJson() => {
    "id": id,

    "message": message,
  };
}
