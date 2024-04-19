import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

//Карта
class Maps extends StatefulWidget {
  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Location _locationController = new Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  LatLng latLng = LatLng(55.755864,37.617698);
  static const LatLng _a = LatLng(55.546190, 37.555427);
  static const LatLng _b = LatLng(55.544561, 37.548100);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
            (_) => {
      getPolylinePoints().then((coordinates) => {
        generatePolylineFromPoints(coordinates)
        })
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        GoogleMap(
          onMapCreated: ((GoogleMapController controller) => _mapController.complete(controller)),
          initialCameraPosition: CameraPosition(target:latLng, zoom: 10),
          markers: {
            Marker(
                markerId: MarkerId("run"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentP!
            ),
            Marker(
              markerId: MarkerId("_a"),
              icon: BitmapDescriptor.defaultMarker,
              position: _a
            ),
            Marker(
                markerId: MarkerId("_b"),
                icon: BitmapDescriptor.defaultMarker,
                position: _b
            ),
          },
          polylines: Set<Polyline>.of(polylines.values),
        ),
      )
    );
  }
  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 16);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionStatus;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if(!_serviceEnabled) {
        return;
      }
    }

    _permissionStatus = await _locationController.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await _locationController.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        _cameraToPosition(_currentP!);
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDQ9v3qCS1wg5WMHq4fYAihHAT1cA922cs",
      PointLatLng(_a.latitude, _a.longitude),
      PointLatLng(_b.latitude, _b.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: Colors.black, points: polylineCoordinates, width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}