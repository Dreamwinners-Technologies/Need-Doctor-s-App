import 'dart:convert';

ErrorResponseModel errorResponseModelFromJson(String str) =>
    ErrorResponseModel.fromJson(json.decode(str));

String errorResponseModelToJson(ErrorResponseModel data) =>
    json.encode(data.toJson());

class ErrorResponseModel {
  ErrorResponseModel({
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path,
  });

  DateTime timestamp;
  int status;
  String error;
  String message;
  String path;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
        error: json["error"],
        message: json["message"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "status": status,
        "error": error,
        "message": message,
        "path": path,
      };
}
