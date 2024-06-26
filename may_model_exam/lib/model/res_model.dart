// To parse this JSON data, do
//
//     final resModel = resModelFromJson(jsonString);

import 'dart:convert';

List<ResModel> resModelFromJson(String str) =>
    List<ResModel>.from(json.decode(str).map((x) => ResModel.fromJson(x)));

String resModelToJson(List<ResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResModel {
  List<String>? domains;
  String? name;
  dynamic stateProvince;
  String? country;
  String? alphaTwoCode;
  List<String>? webPages;

  ResModel({
    this.domains,
    this.name,
    this.stateProvince,
    this.country,
    this.alphaTwoCode,
    this.webPages,
  });

  factory ResModel.fromJson(Map<String, dynamic> json) => ResModel(
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"]!.map((x) => x)),
        name: json["name"],
        stateProvince: json["state-province"],
        country: json["country"],
        alphaTwoCode: json["alpha_two_code"],
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "domains":
            domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "name": name,
        "state-province": stateProvince,
        "country": country,
        "alpha_two_code": alphaTwoCode,
        "web_pages":
            webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
      };
}
