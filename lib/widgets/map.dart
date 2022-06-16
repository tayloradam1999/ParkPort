import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart' hide LatLng;

void main() => runApp(const Map());

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  late GoogleMapController mapController;
  late bool withinPolygon = true;
  final LatLng initialCameraPosition =
      const LatLng(36.15633180705401, -95.99487937064549);
  Set<Marker> markers = {};
  Set<Polygon> polygons = {};
  Location location = Location();
  Polygon holberton = const Polygon(
    polygonId: PolygonId('holberton'),
    points: <LatLng>[
      LatLng(36.15619284753777, -95.99520190638034),
      LatLng(36.156340355250045, -95.99477562448524),
      LatLng(36.15622471651146, -95.99471698253141),
      LatLng(36.1560808507561, -95.99513988123687),
      LatLng(36.15619284753777, -95.99520190638034),
    ],
    visible: true,
  );
  Polygon neighbourhood = const Polygon(
    polygonId: PolygonId('home'),
    points: <LatLng>[
      LatLng(37.42650362286202, -122.09008400922292),
      LatLng(37.42427450616306, -122.07819280096706),
      LatLng(37.41805289302726, -122.07714657878147),
      LatLng(37.41888382240903, -122.0896502097801),
      LatLng(37.42650362286202, -122.09008400922292),
    ],
    visible: true,
  );

  void toggleSwitch(bool value) {
    setState(() {
      withinPolygon = value;
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    location.onLocationChanged.listen((youAreHere) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(youAreHere.latitude!, youAreHere.longitude!),
        zoom: 18.0,
      )));
    });
  }

  Set<Polygon> getPolygons() {
    Set<Polygon> polygonSet = {};
    // call set of polygons from database here
    polygonSet.add(holberton);
    polygonSet.add(neighbourhood);
    return polygonSet;
  }

  checkPolygons(LatLng currentLocation) {
    List<LatLng> holbiePoints = holberton.points;

    // bool withinPolygon = PolygonUtil.containsLocation(currentLocation, holbiePoints, true);

    if (withinPolygon) {
      Navigator.pushReplacementNamed(context, "/FriendsList");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          // width: size.width * 0.7,
          // height: size.height * 0.7,
          child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              markers: markers,
              polygons: getPolygons(),
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: initialCameraPosition,
                zoom: 18.0,
              )),
        ),
        withinPolygon
            ? Container(
                width: size.width * 0.8,
                child: RaisedButton(
                  child: Text(
                    'Enter Experience',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: Color(0xFFe05e4a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    // var position = await _determinePosition();
                    // checkPolygons(position);
                    Navigator.pushReplacementNamed(
                        context, "/ObjectsOnPlanesWidget");
                  },
                ),
              )
            : Container()
      ],
    );
  }

  Future<LatLng> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    LatLng convertedPosition = LatLng(position.latitude, position.longitude);
    return convertedPosition;
  }
}
