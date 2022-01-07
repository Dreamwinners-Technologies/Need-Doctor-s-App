import 'dart:convert';

List<ThanaLists> thanaListsFromJson(String str) => List<ThanaLists>.from(json.decode(str).map((x) => ThanaLists.fromJson(x)));

String thanaListsToJson(List<ThanaLists> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThanaLists {
  ThanaLists({
    this.districtId,
    this.name,
  });

  int districtId;
  String name;

  factory ThanaLists.fromJson(Map<String, dynamic> json) => ThanaLists(
    districtId: json["district_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "district_id": districtId,
    "name": name,
  };
}
