// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  LogInModel({
    this.status,
    this.messageCode,
    this.obj,
  });

  bool status;
  int messageCode;
  Obj obj;

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
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
    this.id,
    this.userId,
    this.roleId,
    this.roleName,
    this.fleetId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.fleetName,
    this.userName,
    this.token,
  });

  String id;
  int userId;
  String roleId;
  String roleName;
  int fleetId;
  String fullName;
  String email;
  String phoneNumber;
  String fleetName;
  String userName;
  String token;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        id: json["Id"],
        userId: json["UserId"],
        roleId: json["RoleId"],
        roleName: json["RoleName"],
        fleetId: json["FleetId"],
        fullName: json["FullName"],
        email: json["Email"],
        phoneNumber: json["PhoneNumber"],
        fleetName: json["FleetName"],
        userName: json["UserName"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "RoleId": roleId,
        "RoleName": roleName,
        "FleetId": fleetId,
        "FullName": fullName,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "FleetName": fleetName,
        "UserName": userName,
        "Token": token,
      };
}
