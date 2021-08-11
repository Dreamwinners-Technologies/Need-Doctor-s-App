import 'dart:convert';

List<AmbulanceModel> ambulanceListFromJson(String str) => List<AmbulanceModel>.from(json.decode(str).map((x) => AmbulanceModel.fromJson(x)));

String ambulanceListToJson(List<AmbulanceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AmbulanceModel {
  AmbulanceModel({
    this.name,
    this.driverName,
    this.contact,
  });

  String name;
  String driverName;
  String contact;

  factory AmbulanceModel.fromJson(Map<String, dynamic> json) => AmbulanceModel(
    name: json["name"],
    driverName: json["driverName"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "driverName": driverName,
    "contact": contact,
  };
}
