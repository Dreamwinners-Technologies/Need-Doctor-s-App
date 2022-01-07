
import 'dart:convert';

List<DistrictLists> districtListsFromJson(String str) => List<DistrictLists>.from(json.decode(str).map((x) => DistrictLists.fromJson(x)));

String districtListsToJson(List<DistrictLists> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictLists {
  DistrictLists({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory DistrictLists.fromJson(Map<String, dynamic> json) => DistrictLists(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
