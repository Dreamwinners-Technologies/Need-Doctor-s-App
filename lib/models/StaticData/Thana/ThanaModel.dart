import 'dart:convert';

List<ThanaModel> thanaListsFromJson(String str) => List<ThanaModel>.from(json.decode(str).map((x) => ThanaModel.fromJson(x)));

String thanaListsToJson(List<ThanaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThanaModel {
  ThanaModel({
    this.districtId,
    this.name,
  });

  int districtId;
  String name;

  factory ThanaModel.fromJson(Map<String, dynamic> json) => ThanaModel(
    districtId: json["district_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "district_id": districtId,
    "name": name,
  };
}
