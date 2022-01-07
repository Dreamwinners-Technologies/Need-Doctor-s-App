
import 'dart:convert';

List<DivisionLists> divisionListJsonFromJson(String str) => List<DivisionLists>.from(json.decode(str).map((x) => DivisionLists.fromJson(x)));

String divisionListJsonToJson(List<DivisionLists> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DivisionLists {
  DivisionLists({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory DivisionLists.fromJson(Map<String, dynamic> json) => DivisionLists(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
