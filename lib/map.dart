// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'coachs.dart';
import 'home page.dart';

class MyMap extends StatelessWidget {
  const MyMap({Key? key, required Type MyMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAJcUEn3nXs5MJb27Qm_E9dfbly3Pz31ps";
  double mylatitude = 0;
  double mylongitude = 0;
  String GymLatitude = '';
  String Gymlongitude = '';

  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(0, 0); //نضع الموقع بعد التحديد هنا
  LatLng endLocation =
      const LatLng(31.990731397960502, 35.95650050101077); //موقع ال gym
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    markers.add(Marker(
      markerId: const MarkerId("2"),
      position: endLocation,
      infoWindow: const InfoWindow(
        title: 'نقطة النهاية ',
        snippet: 'موقع ال gym',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    //fetch direction polylines from Google API

    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(mylatitude, mylongitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: endLocation,
          zoom: 16.0,
        ),
        markers: markers,
        polylines: Set<Polyline>.of(polylines.values),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(left: 305.0, top: 0.0, right: 0, bottom: 0),
        child: FloatingActionButton(
          onPressed: () async {
            getUserCurrentLocation().then((value) async {
              print("${value.latitude} ${value.longitude}");

              markers.add(Marker(
                markerId: MarkerId(startLocation.toString()),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(
                  title: 'نقطة البداية',
                ),
              ));
              /*late LatLng startLocation2 =
                  LatLng(value.latitude, value.longitude);*/
              mylatitude = value.latitude;
              mylongitude = value.longitude;
              //32.02121683509093, 36.086042458303794
              // specified current users location
              CameraPosition cameraPosition = CameraPosition(
                target: LatLng(value.latitude, value.longitude),
                zoom: 14,
              );

              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(cameraPosition));
              getDirections(); //fetch direction polylines from Google API
              setState(() {});
            });
          },
          child: const Icon(Icons.location_on),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
          //backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          backgroundColor: Colors.transparent,
          color: const Color.fromRGBO(92, 96, 106, 1),
          height: 50,
          animationDuration: const Duration(milliseconds: 200),
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: Color.fromRGBO(1, 1, 1, 1),
            ),
            Icon(
              Icons.favorite,
              size: 30,
              color: Color.fromRGBO(1, 1, 1, 1),
            ),
            Icon(
              Icons.search,
              size: 30,
              color: Color.fromRGBO(1, 1, 1, 1),
            ),
            Icon(
              Icons.location_on,
              size: 30,
              color: Color.fromRGBO(1, 1, 1, 1),
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Color.fromRGBO(1, 1, 1, 1),
            ),
          ], //here
          onTap: (index) {
            if (index == 0) {
              setState(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const home(home: home),
                  ),
                );
              });
            } else if (index == 1) {
              setState(() {});
            } else if (index == 2) {
              setState(() {});
            } else if (index == 3) {
              setState(() {});
            } else if (index == 4) {
              setState(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const coach(coach: coach),
                  ),
                );
              });
            }
          }),
    );
  }
}
