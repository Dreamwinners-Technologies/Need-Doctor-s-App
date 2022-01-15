// To parse this JSON data, do
//
//     final districtLists = districtListsFromJson(jsonString);

import 'dart:convert';

List<DistrictModel> districtModelsFromJson(String str) => List<DistrictModel>.from(json.decode(str).map((x) => DistrictModel.fromJson(x)));

String districtModelsToJson(List<DistrictModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictModel {
  DistrictModel({
    this.id,
    this.divisionId,
    this.name,
  });

  int id;
  int divisionId;
  String name;

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
    id: json["id"],
    divisionId: json["division_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "division_id": divisionId,
    "name": name,
  };
}
