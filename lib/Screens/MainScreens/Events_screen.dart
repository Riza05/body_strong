//События
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Evenets_screen extends StatelessWidget {
  const Evenets_screen({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         body: _Events_screen(),
       )
       /*theme: ThemeData(
         elevatedButtonTheme: ElevatedButtonThemeData(
           style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
             foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
               RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
             ),
           ),
         ),
       ),
       home: Scaffold(
         body: Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
               fit: BoxFit.cover,
             ),
           ),
           child: const Center(
             child: Column(
               children: [
                 Text("События", style: TextStyle(fontSize: 38)),
                 Text("Прими участие в беговом марафоне", style: TextStyle(fontSize: 26)),
                 Image(image: AssetImage("assets/26956302.png"), fit: BoxFit.fill),
                 Text("Начало: 14:00\n"
                     "Где: Леоновская роща улица Вильгельма Пика)", style: TextStyle(fontSize: 26)),
                 _Events_screen()
               ]
             ),
           ),
         )
       )*/
     );
  }
}

class _Events_screen extends StatefulWidget {
  const _Events_screen({super.key});

  @override
  State<_Events_screen> createState() => _Events_screenState();
}

class _Events_screenState extends State<_Events_screen> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
          target: LatLng(23.810331, 90.412521),
          zoom: 12),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

