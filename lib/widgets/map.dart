import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(36.15643, -95.99486);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // Expanded(
      // child: GoogleMap(
      //   onMapCreated: _onMapCreated,
      //   initialCameraPosition: CameraPosition(
      //     target: _center,
      //     zoom: 17.5,
      //   ),
      // ),
    // );
  }
}
