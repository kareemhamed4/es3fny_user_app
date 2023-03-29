import 'dart:async';
import 'dart:math';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap extends StatefulWidget {
  final bool isGoToMyLocationEnabled;
  final bool isTracking;
  const MyGoogleMap(
      {Key? key,
      required this.isGoToMyLocationEnabled,
      required this.isTracking})
      : super(key: key);

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late bool isGoToMyLocationEnabled;
  late bool isTracking;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static LatLng sourceLocation =
      LatLng(currentLocation!.latitude, currentLocation!.longitude);
  static const LatLng destination = LatLng(30.7924168532, 30.9987951871);

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    if (currentLocation != null) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
      );
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
        setState(() {});
      }
    }
  }

  BitmapDescriptor patientMarkerIcon = BitmapDescriptor.defaultMarker;
  void addCustomIconForPatient() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/patient_maker.png")
        .then((icon) {
      setState(() {
        patientMarkerIcon = icon;
      });
    });
  }

  BitmapDescriptor ambulanceMarkerIcon = BitmapDescriptor.defaultMarker;
  void addCustomIconForAmbulance() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/ambulance-marker.png")
        .then((icon) {
      setState(() {
        ambulanceMarkerIcon = icon;
      });
    });
  }
  String? darkMapStyle;
  String? lightMapStyle;
  Future loadMapStyles() async {
    darkMapStyle  = await rootBundle.loadString('assets/map_style/night.json');
    lightMapStyle = await rootBundle.loadString('assets/map_style/light.json');
  }

  double totalDistance = 0;
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return totalDistance = 12742 * asin(sqrt(a));
  }
  @override
  void initState() {
    loadMapStyles();
    calculateDistance(sourceLocation.latitude,sourceLocation.longitude,destination.latitude,destination.longitude);
    print(totalDistance.toString());
    addCustomIconForAmbulance();
    addCustomIconForPatient();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isGoToMyLocationEnabled = widget.isGoToMyLocationEnabled;
    isTracking = widget.isTracking;
    return SizedBox(
      width: double.infinity,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: isGoToMyLocationEnabled,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 17,
          bearing: 0.0,
          tilt: 0.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.setMapStyle(MainCubit.get(context).isDark ? darkMapStyle : lightMapStyle);
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
          ),
        },
        markers: {
          Marker(
            markerId: const MarkerId("source"),
            position: sourceLocation,
            draggable: true,
            onDragEnd: (value) {},
            icon: patientMarkerIcon
          ),
          if (isTracking)
            Marker(
              markerId: const MarkerId("destination"),
              position: destination,
              draggable: true,
              onDragEnd: (value) {},
              icon: ambulanceMarkerIcon,
            ),
        },
      ),
    );
  }
}
