import 'dart:convert';

JwtResponseModel jwtResponseModelFromJson(String str) => JwtResponseModel.fromJson(json.decode(str));

String jwtResponseModelToJson(JwtResponseModel data) => json.encode(data.toJson());

class JwtResponseModel {
  JwtResponseModel({
    this.name,
    this.phoneNo,
    this.roles,
    this.token,
    this.type,
  });

  String name;
  String phoneNo;
  List<String> roles;
  String token;
  String type;

  factory JwtResponseModel.fromJson(Map<String, dynamic> json) => JwtResponseModel(
    name: json["name"],
    phoneNo: json["phoneNo"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    token: json["token"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNo": phoneNo,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "token": token,
    "type": type,
  };
}
