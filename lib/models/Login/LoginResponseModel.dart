import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
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

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
