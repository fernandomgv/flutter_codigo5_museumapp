// To parse this JSON data, do
//
//     final museumModel = museumModelFromJson(jsonString);

import 'dart:convert';

MuseumModel museumModelFromJson(String str) => MuseumModel.fromJson(json.decode(str));

String museumModelToJson(MuseumModel data) => json.encode(data.toJson());

class MuseumModel {
  MuseumModel({
  required  this.id,
    required    this.name,
    required  this.description,
    required  this.city,
    required  this.country,
    required  this.adress,
    required  this.latitude,
    required  this.longitude,
    required  this.image,
  });

  int id;
  String name;
  String description;
  String city;
  String country;
  String adress;
  double latitude;
  double longitude;
  String image;

  factory MuseumModel.fromJson(Map<String, dynamic> json) => MuseumModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    country: json["country"],
    adress: json["adress"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "country": country,
    "adress": adress,
    "latitude": latitude,
    "longitude": longitude,
    "image": image,
  };
}
