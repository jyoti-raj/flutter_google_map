// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(MaterialApp(
    home: MyGoogleMap(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  lw1() async {
    var p = await Geolocator().getCurrentPosition();
    print(p); //print current coordinates in latitude and longitude
  }

  lw2() async {
    double lat = 26.813552;
    double lon = 85.6853802;
    var key = 'api_key_value';
    WeatherFactory weather = WeatherFactory(key);
    Weather p = await weather.currentWeatherByLocation(lat,
        lon); //show weather according to coordinates...we can also get weather info by ciyt name or by country name
    print(p); //print current weather as from given coordinates
  }

  @override
  Widget build(BuildContext context) {
    var cd = CameraPosition(
      target: LatLng(26.813552, 85.6853802),
      zoom: 10,
      tilt: 50,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Application'),
      ),
      body: GoogleMap(
        initialCameraPosition: cd,
        mapType: MapType.satellite,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          lw1();
          lw2();
        },
        child: Icon(Icons.screen_share),
      ),
    );
  }
}
