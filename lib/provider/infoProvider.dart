import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_optimum/model/lastTripModel.dart';
import 'package:flutter_optimum/model/loginModel.dart';
import 'package:flutter_optimum/screens/homePage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'file:///D:/myFlutter/flutter_optimum/lib/model/model.dart';
import 'file:///D:/myFlutter/flutter_optimum/lib/services/services.dart';

import '../screens/logIn.dart';

class Edit extends ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  var userNameText, passowrdText;

  Api api = Api();
  List datas, lastTripData;
  var logInInfo;
  bool getData = true;
  var markers = HashSet<Marker>();
  bool ckecked = false;
  check() {
    ckecked = true;
    print(ckecked);
    notifyListeners();
  }

  splashNavigator(context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogIn())));
  }

  userNameOnchange() {
    userNameText = userName.text;
    // print(userNameText);
  }

  userPassowrdOnchange() {
    passowrdText = userPassword.text;
    // print(passowrdText);
  }

  // "greeadmin@optimumsc.net", "P@ssw0rd"
  logInfetch(BuildContext context) async {
    await api.logIn(userNameText, passowrdText);
    if (api.logInResponse.statusCode == 200) {
      var jsonResonse = api.logInResponse.body;
      var data = LogInModel.fromJson(json.decode(jsonResonse));
      logInInfo = data.obj;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }));
      notifyListeners();
    } else {
      print('error');
      notifyListeners();
    }

    notifyListeners();
  }

  fetchData(BuildContext context) async {
    await api.info(logInInfo.userId, logInInfo.fleetId);
    if (api.getInfoResponse.statusCode == 200) {
      getData = false;
      var jsonResonse = api.getInfoResponse.body;
      var data = ProductModel.fromJson(json.decode(jsonResonse));
      datas = data.obj.listOfUnit;
      notifyListeners();
    } else {
      print('error');
      getData = true;
      notifyListeners();
    }
    notifyListeners();
  }

  lastTrip(BuildContext context) async {
    await api.lastTripApi(datas[0].serialNumber);
    if (api.lastTripResponse.statusCode == 200) {
      var jsonResonse = api.lastTripResponse.body;
      var data = LastTripModel.fromJson(json.decode(jsonResonse));
      lastTripData = data.obj.tripData;
      for (var i = 0; i < lastTripData.length; i++) {}
      notifyListeners();
    } else {
      print('error');
      notifyListeners();
    }
    notifyListeners();
  }

  LastTripMarkers(index) {
    for (var i = 0; i < lastTripData.length; i++) {
      print(lastTripData[index].latitude[i]);
//      markers.add(
//        Marker(
//          markerId: MarkerId(lastTripData[index].latitude.toString()),
//          position: LatLng(
//              lastTripData[index].latitude[i], datas[index].longitude[i]),
//          icon: lastTripMarker,
//        ),
//      );
    }
    notifyListeners();
  }

  BitmapDescriptor customMarker;
  BitmapDescriptor lastTripMarker;
//  getCustomMarker() async {
//    for (var i = 0; i < datas.length; i++) {
//      if (datas[i].statusUnit == 'Offline') {
//        customMarker = await BitmapDescriptor.fromAssetImage(
//            ImageConfiguration.empty, 'assets/car_offline.png',
//            mipmaps: true);
//      } else {
//        customMarker = await BitmapDescriptor.fromAssetImage(
//            ImageConfiguration.empty, 'assets/car_moving.png',
//            mipmaps: true);
//      }
//    }
//    notifyListeners();
//  }

  getMarkers() {
    for (var i = 0; i < datas.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(datas[i].latitude.toString()),
          position: LatLng(datas[i].latitude, datas[i].longitude),
          icon: customMarker,
        ),
      );
    }
    notifyListeners();
  }

  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/car_offline.png");
    notifyListeners();
  }

  lastTripCustomMarker() async {
    lastTripMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/offline_icon.png");
    notifyListeners();
  }
}
