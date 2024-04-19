import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//События
class Evenets_screen extends StatefulWidget {
  @override
  State<Evenets_screen> createState() => _Evenets_screenState();
}

class _Evenets_screenState extends State<Evenets_screen> {
  LatLng latLng = LatLng(55.755864,37.617698);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(target:latLng, zoom: 16),
        ),
      )
    );
  }
}