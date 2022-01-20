
import 'dart:convert';

List<DivisionModel> divisionListJsonFromJson(String str) => List<DivisionModel>.from(json.decode(str).map((x) => DivisionModel.fromJson(x)));

String divisionListJsonToJson(List<DivisionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DivisionModel {
  DivisionModel({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory DivisionModel.fromJson(Map<String, dynamic> json) => DivisionModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
