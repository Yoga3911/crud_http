// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.nama,
    required this.umur,
  });

  final String id;
  final String nama;
  final String umur;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        nama: json["nama"],
        umur: json["umur"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "umur": umur,
      };
}
