import 'dart:convert';

ZippoModel zippoModelFromJson(String str) =>
    ZippoModel.fromJson(json.decode(str));

String zippoModelToJson(ZippoModel data) => json.encode(data.toJson());

class ZippoModel {
  String? postCode;
  String? country;
  String? countryAbbreviation;
  List<Place>? places;

  ZippoModel({
    this.postCode,
    this.country,
    this.countryAbbreviation,
    this.places,
  });

  factory ZippoModel.fromJson(Map<String, dynamic> json) => ZippoModel(
        postCode: json["post code"],
        country: json["country"],
        countryAbbreviation: json["country abbreviation"],
        places: json["places"] == null
            ? []
            : List<Place>.from(json["places"]!.map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "post code": postCode,
        "country": country,
        "country abbreviation": countryAbbreviation,
        "places": places == null
            ? []
            : List<dynamic>.from(places!.map((x) => x.toJson())),
      };
}

class Place {
  String? placeName;
  String? longitude;
  String? state;
  String? stateAbbreviation;
  String? latitude;

  Place({
    this.placeName,
    this.longitude,
    this.state,
    this.stateAbbreviation,
    this.latitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeName: json["place name"],
        longitude: json["longitude"],
        state: json["state"],
        stateAbbreviation: json["state abbreviation"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "place name": placeName,
        "longitude": longitude,
        "state": state,
        "state abbreviation": stateAbbreviation,
        "latitude": latitude,
      };
}
