import 'dart:async';

import 'package:clustering_google_maps/clustering_google_maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';

class GoogleMapScreen extends StatefulWidget {
  static String tag = '/GoogleMapScreen';

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> with AfterLayoutMixin<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  ClusteringHelper clusteringHelper;
  List<LatLngAndGeohash> list;

  List<Marker> markers = List();
  var mMapType = MapType.normal;

  initMemoryClustering(context) async {
    list = await getListOfLatLngAndGeoHash(context);
    clusteringHelper = ClusteringHelper.forMemory(
      list: list,
      updateMarkers: updateMarkers,
      aggregationSetup: AggregationSetup(markerSize: 150), // You can customize marker size, colors and size limits
    );
    setState(() {});
  }

  updateMarkers(Set<Marker> markers) {
    this.markers = markers.toList();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    initMemoryClustering(context);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);

    CameraPosition initialPosition = CameraPosition(
      target: LatLng(43.7262115, 12.636526499999945),
      zoom: 5,
    );

    CameraPosition newPosition = CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414);

    return Scaffold(
      appBar: getAppBar(context, 'Google Maps with Clustering', actions: buildActionButtons()),
      body: GoogleMap(
        compassEnabled: true,
        indoorViewEnabled: true,
        trafficEnabled: true,
        mapType: mMapType,
        markers: markers.toSet(),
        onCameraMove: (newPosition) => clusteringHelper.onCameraMove(newPosition, forceUpdate: false),
        onCameraIdle: clusteringHelper != null ? clusteringHelper.onMapIdle : null,
        initialCameraPosition: initialPosition,
        onTap: _handleTap,
        onMapCreated: (GoogleMapController controller) {
          clusteringHelper.mapController = controller;
          _controller.complete(controller);
          clusteringHelper.updateMap();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_on),
          onPressed: () async {
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
          }),
    );
  }

  buildActionButtons() {
    return [
      PopupMenuButton(
        itemBuilder: (_) => [
          PopupMenuItem(
            child: InkWell(
              child: text('Hybrid'),
              onTap: () {
                setState(() {
                  mMapType = MapType.hybrid;
                });
              },
            ),
          ),
          PopupMenuItem(
            child: InkWell(
              child: text('Normal'),
              onTap: () {
                setState(() {
                  mMapType = MapType.normal;
                });
              },
            ),
          ),
          PopupMenuItem(
            child: InkWell(
              child: text('Satellite'),
              onTap: () {
                setState(() {
                  mMapType = MapType.satellite;
                });
              },
            ),
          ),
          PopupMenuItem(
            child: InkWell(
              child: text('Terrain'),
              onTap: () {
                setState(() {
                  mMapType = MapType.terrain;
                });
              },
            ),
          ),
        ],
      )
    ];
  }

  getLocation(LatLng point) async {
    var coordinates = Coordinates(point.latitude, point.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first.addressLine;
  }

  void _handleTap(LatLng point) async {
    toast('Fetching Location');
    var location = await getLocation(point);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        draggable: true,
        infoWindow: InfoWindow(
          title: location,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    });
  }
}
