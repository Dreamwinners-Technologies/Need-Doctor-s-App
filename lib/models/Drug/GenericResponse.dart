
import 'dart:convert';

List<String> genericResponseFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String genericResponseToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
