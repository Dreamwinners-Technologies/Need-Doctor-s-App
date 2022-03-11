// To parse this JSON data, do
//
//     final usefulLink = usefulLinkFromJson(jsonString);

import 'dart:convert';

List<UsefulLink> usefulLinkFromJson(String str) => List<UsefulLink>.from(json.decode(str).map((x) => UsefulLink.fromJson(x)));

String usefulLinkToJson(List<UsefulLink> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsefulLink {
  UsefulLink({
    this.title,
    this.link,
    this.icon,
    this.type,
  });

  String title;
  String link;
  String icon;
  String type;

  factory UsefulLink.fromJson(Map<String, dynamic> json) => UsefulLink(
    title: json["title"],
    link: json["link"],
    icon: json["icon"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
    "icon": icon,
    "type": type,
  };
}
