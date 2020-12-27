// To parse this JSON data, do
//
//     final lastTripModel = lastTripModelFromJson(jsonString);

import 'dart:convert';

LastTripModel lastTripModelFromJson(String str) =>
    LastTripModel.fromJson(json.decode(str));

String lastTripModelToJson(LastTripModel data) => json.encode(data.toJson());

class LastTripModel {
  LastTripModel({
    this.status,
    this.messageCode,
    this.obj,
  });

  bool status;
  int messageCode;
  Obj obj;

  factory LastTripModel.fromJson(Map<String, dynamic> json) => LastTripModel(
        status: json["Status"],
        messageCode: json["MessageCode"],
        obj: Obj.fromJson(json["Obj"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "MessageCode": messageCode,
        "Obj": obj.toJson(),
      };
}

class Obj {
  Obj({
    this.tripData,
  });

  List<TripDatum> tripData;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        tripData: List<TripDatum>.from(
            json["TripData"].map((x) => TripDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TripData": List<dynamic>.from(tripData.map((x) => x.toJson())),
      };
}

class TripDatum {
  TripDatum({
    this.latitude,
    this.longitude,
    this.speed,
    this.direction,
    this.gpsDateTime,
    this.statusUnit,
    this.engineStatus,
    this.statusCode,
  });

  double latitude;
  double longitude;
  double speed;
  int direction;
  DateTime gpsDateTime;
  dynamic statusUnit;
  dynamic engineStatus;
  int statusCode;

  factory TripDatum.fromJson(Map<String, dynamic> json) => TripDatum(
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        speed: json["Speed"],
        direction: json["Direction"],
        gpsDateTime: DateTime.parse(json["GpsDateTime"]),
        statusUnit: json["StatusUnit"],
        engineStatus: json["EngineStatus"],
        statusCode: json["StatusCode"],
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "Speed": speed,
        "Direction": direction,
        "GpsDateTime": gpsDateTime.toIso8601String(),
        "StatusUnit": statusUnit,
        "EngineStatus": engineStatus,
        "StatusCode": statusCode,
      };
}
