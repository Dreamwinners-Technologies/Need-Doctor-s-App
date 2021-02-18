
import 'dart:convert';

List<ModeratorListResponse> moderatorListResponseFromJson(String str) => List<ModeratorListResponse>.from(json.decode(str).map((x) => ModeratorListResponse.fromJson(x)));

String moderatorListResponseToJson(List<ModeratorListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModeratorListResponse {
  ModeratorListResponse({
    this.name,
    this.phoneNo,
  });

  String name;
  String phoneNo;

  factory ModeratorListResponse.fromJson(Map<String, dynamic> json) => ModeratorListResponse(
    name: json["name"],
    phoneNo: json["phoneNo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNo": phoneNo,
  };
}
