import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optimum/style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/infoProvider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var getData = Provider.of<Edit>(context, listen: false);
    getData.fetchData(context);
    getData.getCustomMarker();
    getData.lastTrip(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        title: Text(
          'OptimumFleet',
          style: TextStyle(
            fontFamily: rock,
            fontSize: 24,
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8),
            width: 10,
            height: 10,
            child: Image.asset('assets/menu_icon.png'),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: white,
                size: 26,
              ),
              onPressed: () {}),
        ],
      ),
      body: Consumer<Edit>(
        builder: (context, state, widget) {
          return state.getData == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            state.datas[0].latitude, state.datas[0].longitude),
                        zoom: 12,
                      ),
                      onMapCreated: (GoogleMapController googleMapController) {
                        state.getMarkers();
                      },
                      markers: state.markers,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 14,
                      child: GestureDetector(
                        onTap: () {
                          _openSheet();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: 60,
                            width: 60,
                            color: orange,
                            child: Image.asset(
                              'assets/filter_icon.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  void _openSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Text(
                  'Display Units',
                  style: TextStyle(
                    fontFamily: rock,
                    fontSize: 20,
                  ),
                ),
                trailing: Text(
                  'Refresh List',
                  style: TextStyle(
                    fontFamily: rock,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<Edit>(
                  builder: (context, state, widget) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.datas.length,
                      itemBuilder: (BuildContext, index) {
                        return Card(
                          child: Container(
                            height: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      _customRow('assets/car_icon.png',
                                          state.datas[index].unitName, 20, 20),
                                      Image.asset(
                                        'assets/unit_settings_icon.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  _customRow("assets/driver_icon.png",
                                      state.datas[index].driverName, 20, 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      _customRow(
                                          (state.datas[index].statusUnit) ==
                                                  "Offline"
                                              ? "assets/offline_icon.png"
                                              : "assets/online_icon.png",
                                          state.datas[index].statusUnit,
                                          16,
                                          16),
                                      _customRow(
                                          "assets/spead_icon.png",
                                          state.datas[index].speed.toString(),
                                          20,
                                          20),
                                      _customRow(
                                          "assets/fuel_icon.png",
                                          (state.datas[index].fuelLevel == null)
                                              ? 'Null'
                                              : state.datas[index].fuelLevel,
                                          20,
                                          20),
                                      _customRow(
                                          "assets/distance_icon.png",
                                          state.datas[index].currentKm
                                              .toString(),
                                          20,
                                          20),
                                    ],
                                  ),
                                  _customRow("assets/group_icon.png",
                                      state.datas[index].unitGroup, 20, 20),
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: gray.withOpacity(.5),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Text(
                                            "Last Trip",
                                            style: TextStyle(
                                                fontFamily: rock,
                                                fontSize: 17,
                                                color: Colors.black
                                                    .withOpacity(.6)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 6),
                                        ),
                                        onTap: () {
                                          state.LastTripMarkers(index);
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: gray.withOpacity(.5),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Text(
                                            "Tracking",
                                            style: TextStyle(
                                                fontFamily: rock,
                                                fontSize: 17,
                                                color: Colors.black
                                                    .withOpacity(.6)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 6),
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        });
  }

  Widget _customRow(path, info, double w, double s) {
    return Row(
      children: <Widget>[
        Image.asset(
          path,
          width: w,
          height: s,
        ),
        SizedBox(width: 10),
        Text(
          info,
          style: TextStyle(fontFamily: rock, fontSize: 16),
        ),
      ],
    );
  }
}
