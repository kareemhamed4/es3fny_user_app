import 'dart:async';
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
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static LatLng sourceLocation =
      LatLng(currentLocation!.latitude, currentLocation!.longitude);
  static const LatLng destination = LatLng(30.6860, 31.1447);

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

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/ambulance-marker.png")
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }
  String? darkMapStyle;
  String? lightMapStyle;
  Future loadMapStyles() async {
    darkMapStyle  = await rootBundle.loadString('assets/map_style/night.json');
    lightMapStyle = await rootBundle.loadString('assets/map_style/light.json');
  }
  @override
  void initState() {
    loadMapStyles();
    addCustomIcon();
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
          ),
          if (isTracking)
            Marker(
              markerId: const MarkerId("destination"),
              position: destination,
              draggable: true,
              onDragEnd: (value) {},
              icon: markerIcon,
            ),
        },
      ),
    );
  }
}
