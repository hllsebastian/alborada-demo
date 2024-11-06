import 'package:alborada_demo/app/presentation/design/alborada_texts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AlboradaMap extends StatefulWidget {
  const AlboradaMap({super.key});

  @override
  AlboradaMapState createState() => AlboradaMapState();
}

class AlboradaMapState extends State<AlboradaMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(48.8543, 2.3333);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AlboradaTexts.findInitiative),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
