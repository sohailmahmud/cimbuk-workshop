import 'dart:convert';

import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<List<LatLngAndGeohash>> getListOfLatLngAndGeoHash(BuildContext context) async {
  try {
    final fakeList = await loadDataFromJson(context);
    List<LatLngAndGeohash> myPoints = List();
    for (int i = 0; i < fakeList.length; i++) {
      final fakePoint = fakeList[i];
      print(fakePoint["LATITUDE"]);
      print(fakePoint["LONGITUDE"]);
      final p = LatLngAndGeohash(
        LatLng(fakePoint["LATITUDE"], fakePoint["LONGITUDE"]),
      );
      myPoints.add(p);
    }
    return myPoints;
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<List<dynamic>> loadDataFromJson(BuildContext context) async {
  final fakeData = await DefaultAssetBundle.of(context).loadString('assets/map_point.json');
  return json.decode(fakeData.toString());
}
