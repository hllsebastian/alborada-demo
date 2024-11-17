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
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Stack(
        children: [
          Column(
            children: [
              // Text(AlboradaTexts.findInitiative),
              // Container(
              //   height: MediaQuery.sizeOf(context).width * 4,
              //   width: MediaQuery.sizeOf(context).width * 0.7,
              //   color: Colors.amber,
              // )
              Flexible(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
