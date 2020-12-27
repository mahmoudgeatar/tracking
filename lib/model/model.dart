// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.status,
    this.messageCode,
    this.obj,
  });

  bool status;
  int messageCode;
  Obj obj;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["Status"] == null ? null : json["Status"],
        messageCode: json["MessageCode"] == null ? null : json["MessageCode"],
        obj: json["Obj"] == null ? null : Obj.fromJson(json["Obj"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status == null ? null : status,
        "MessageCode": messageCode == null ? null : messageCode,
        "Obj": obj == null ? null : obj.toJson(),
      };
}

class Obj {
  Obj({
    this.listOfUnit,
  });

  List<ListOfUnit> listOfUnit;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        listOfUnit: json["ListOfUnit"] == null
            ? null
            : List<ListOfUnit>.from(
                json["ListOfUnit"].map((x) => ListOfUnit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ListOfUnit": listOfUnit == null
            ? null
            : List<dynamic>.from(listOfUnit.map((x) => x.toJson())),
      };
}

class ListOfUnit {
  ListOfUnit({
    this.unitName,
    this.driverName,
    this.modelYear,
    this.brand,
    this.brandId,
    this.unitMainType,
    this.typeIcon,
    this.unitGroup,
    this.serialNumber,
    this.address,
    this.latitude,
    this.longitude,
    this.gpsDateTime,
    this.fuelLevel,
    this.highFuelLevel,
    this.lowFuelLevel,
    this.speed,
    this.direction,
    this.currentKm,
    this.currentWorkHours,
    this.isSos,
    this.doorStatus,
    this.isOverSpeed,
    this.isGpsAntenaOpenCircuit,
    this.engineStatus,
    this.statusUnit,
    this.powerStatus,
    this.locating,
    this.deviceId,
    this.statusCode,
    this.canEngineRpm,
    this.canEnginetemperature,
    this.canFuelLevel,
    this.canMileage,
    this.canSpeedMeter,
    this.canSensorTemperature,
    this.canDoorStatus,
    this.backBoxDoor,
    this.bluTemp,
    this.bluBattery,
    this.bluHumidity,
  });
  String unitName;
  String driverName;
  String modelYear;
  String brand;
  dynamic brandId;
  dynamic unitMainType;
  dynamic typeIcon;
  String unitGroup;
  String serialNumber;
  String address;
  double latitude;
  double longitude;
  DateTime gpsDateTime;
  dynamic fuelLevel;
  dynamic highFuelLevel;
  dynamic lowFuelLevel;
  var speed;
  int direction;
  var currentKm;
  double currentWorkHours;
  bool isSos;
  String doorStatus;
  bool isOverSpeed;
  bool isGpsAntenaOpenCircuit;
  String engineStatus;
  String statusUnit;
  String powerStatus;
  String locating;
  int deviceId;
  int statusCode;
  dynamic canEngineRpm;
  dynamic canEnginetemperature;
  dynamic canFuelLevel;
  dynamic canMileage;
  dynamic canSpeedMeter;
  dynamic canSensorTemperature;
  dynamic canDoorStatus;
  dynamic backBoxDoor;
  dynamic bluTemp;
  dynamic bluBattery;
  dynamic bluHumidity;

  factory ListOfUnit.fromJson(Map<String, dynamic> json) => ListOfUnit(
        unitName: json["UnitName"] == null ? null : json["UnitName"],
        driverName: json["DriverName"] == null ? null : json["DriverName"],
        modelYear: json["ModelYear"] == null ? null : json["ModelYear"],
        brand: json["Brand"] == null ? null : json["Brand"],
        brandId: json["BrandId"],
        unitMainType: json["UnitMainType"],
        typeIcon: json["TypeIcon"],
        unitGroup: json["UnitGroup"] == null ? null : json["UnitGroup"],
        serialNumber:
            json["SerialNumber"] == null ? null : json["SerialNumber"],
        address: json["Address"] == null ? null : json["Address"],
        latitude: json["Latitude"] == null ? null : json["Latitude"].toDouble(),
        longitude:
            json["Longitude"] == null ? null : json["Longitude"].toDouble(),
        gpsDateTime: json["GpsDateTime"] == null
            ? null
            : DateTime.parse(json["GpsDateTime"]),
        fuelLevel: json["FuelLevel"],
        highFuelLevel: json["HighFuelLevel"],
        lowFuelLevel: json["LowFuelLevel"],
        speed: json["Speed"] == null ? null : json["Speed"],
        direction: json["Direction"] == null ? null : json["Direction"],
        currentKm: json["CurrentKm"] == null ? null : json["CurrentKm"],
        currentWorkHours: json["CurrentWorkHours"] == null
            ? null
            : json["CurrentWorkHours"].toDouble(),
        isSos: json["IsSos"] == null ? null : json["IsSos"],
        doorStatus: json["DoorStatus"] == null ? null : json["DoorStatus"],
        isOverSpeed: json["IsOverSpeed"] == null ? null : json["IsOverSpeed"],
        isGpsAntenaOpenCircuit: json["IsGpsAntenaOpenCircuit"] == null
            ? null
            : json["IsGpsAntenaOpenCircuit"],
        engineStatus:
            json["EngineStatus"] == null ? null : json["EngineStatus"],
        statusUnit: json["StatusUnit"] == null ? null : json["StatusUnit"],
        powerStatus: json["PowerStatus"] == null ? null : json["PowerStatus"],
        locating: json["Locating"] == null ? null : json["Locating"],
        deviceId: json["DeviceId"] == null ? null : json["DeviceId"],
        statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
        canEngineRpm: json["CanEngineRPM"],
        canEnginetemperature: json["CanEnginetemperature"],
        canFuelLevel: json["CanFuelLevel"],
        canMileage: json["CanMileage"],
        canSpeedMeter: json["CanSpeedMeter"],
        canSensorTemperature: json["CanSensorTemperature"],
        canDoorStatus: json["CanDoorStatus"],
        backBoxDoor: json["BackBoxDoor"],
        bluTemp: json["BluTemp"],
        bluBattery: json["BluBattery"],
        bluHumidity: json["BluHumidity"],
      );

  Map<String, dynamic> toJson() => {
        "UnitName": unitName == null ? null : unitName,
        "DriverName": driverName == null ? null : driverName,
        "ModelYear": modelYear == null ? null : modelYear,
        "Brand": brand == null ? null : brand,
        "BrandId": brandId,
        "UnitMainType": unitMainType,
        "TypeIcon": typeIcon,
        "UnitGroup": unitGroup == null ? null : unitGroup,
        "SerialNumber": serialNumber == null ? null : serialNumber,
        "Address": address == null ? null : address,
        "Latitude": latitude == null ? null : latitude,
        "Longitude": longitude == null ? null : longitude,
        "GpsDateTime":
            gpsDateTime == null ? null : gpsDateTime.toIso8601String(),
        "FuelLevel": fuelLevel,
        "HighFuelLevel": highFuelLevel,
        "LowFuelLevel": lowFuelLevel,
        "Speed": speed == null ? null : speed,
        "Direction": direction == null ? null : direction,
        "CurrentKm": currentKm == null ? null : currentKm,
        "CurrentWorkHours": currentWorkHours == null ? null : currentWorkHours,
        "IsSos": isSos == null ? null : isSos,
        "DoorStatus": doorStatus == null ? null : doorStatus,
        "IsOverSpeed": isOverSpeed == null ? null : isOverSpeed,
        "IsGpsAntenaOpenCircuit":
            isGpsAntenaOpenCircuit == null ? null : isGpsAntenaOpenCircuit,
        "EngineStatus": engineStatus == null ? null : engineStatus,
        "StatusUnit": statusUnit == null ? null : statusUnit,
        "PowerStatus": powerStatus == null ? null : powerStatus,
        "Locating": locating == null ? null : locating,
        "DeviceId": deviceId == null ? null : deviceId,
        "StatusCode": statusCode == null ? null : statusCode,
        "CanEngineRPM": canEngineRpm,
        "CanEnginetemperature": canEnginetemperature,
        "CanFuelLevel": canFuelLevel,
        "CanMileage": canMileage,
        "CanSpeedMeter": canSpeedMeter,
        "CanSensorTemperature": canSensorTemperature,
        "CanDoorStatus": canDoorStatus,
        "BackBoxDoor": backBoxDoor,
        "BluTemp": bluTemp,
        "BluBattery": bluBattery,
        "BluHumidity": bluHumidity,
      };
}
