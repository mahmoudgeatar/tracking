import 'package:flutter_optimum/model/lastTripModel.dart';
import 'package:flutter_optimum/model/loginModel.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class Api {
  var getInfoResponse, logInResponse, lastTripResponse;
  Future<ProductModel> info(var userId, var fleetId) async {
    getInfoResponse = await http.get(
        'http://swaqimobileapi.optimumfleet.net/api/Dashboard/GetDashboardUnitByUserId?_userId=$userId&_fleetId=$fleetId');
    return productModelFromJson(getInfoResponse.body);
  }

  Future<LogInModel> logIn(var userName, var password) async {
    logInResponse = await http.post(
        'http://swaqimobileapi.optimumfleet.net/api/User/UserLogin',
        body: {
          "_userName": userName,
          "_password": password,
          "_userToken": "string"
        });
    return logInModelFromJson(logInResponse.body);
  }

  Future<LastTripModel> lastTripApi(var serialNumber) async {
    lastTripResponse = await http.get(
      'http://swaqimobileapi.optimumfleet.net/api/Dashboard/GetLastTripByUnitSerial?_serialNumber=$serialNumber',
    );
    return lastTripModelFromJson(lastTripResponse.body);
  }
}
