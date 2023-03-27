import 'dart:async';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/location_helper.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  double sheetHeight = 100.0;
  bool isSheetExpanded = false;
  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      sheetHeight -= details.primaryDelta!;
      if (sheetHeight < 100) {
        sheetHeight = 100;
        isSheetExpanded = false;
      } else if (sheetHeight > 220) {
        sheetHeight = 220;
        isSheetExpanded = true;
      }
    });
  }

  static Position? currentLocation;
  Future<void> getMyCurrentLocation() async {
    await LocationHelper.getCurrentLocation();
    currentLocation = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  static LatLng sourceLocation = LatLng(currentLocation!.latitude, currentLocation!.longitude);
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

  Widget buildFloatingSearchBar() => FloatingSearchBar(
        controller: floatingSearchBarController,
        hintStyle:
            Theme.of(context).textTheme.bodyText2!.copyWith(color: myFavColor1),
        elevation: 6,
        queryStyle: Theme.of(context).textTheme.bodyText2,
        hint: "ابحث عن مكان...",
        border: BorderSide.none,
        margins: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        height: 52,
        backgroundColor: Theme.of(context).cardColor,
        iconColor: myFavColor1,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 750),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: 0,
        openAxisAlignment: 600,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {},
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
                icon: const Icon(Icons.place_outlined), onPressed: () {}),
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [],
            ),
          );
        },
      );

  @override
  void initState() {
    getMyCurrentLocation();
    addCustomIcon();
    getPolyPoints();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {},
          child: Text(
            "track_info_title".tr(context),
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
        ),
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      body: currentLocation == null
          ? Center(
              child: Text(
              "Loading",
              style: Theme.of(context).textTheme.caption,
            ))
          : Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
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
                    Marker(
                      markerId: const MarkerId("destination"),
                      position: destination,
                      draggable: true,
                      onDragEnd: (value) {},
                      icon: markerIcon,
                    ),
                  },
                ),
                buildFloatingSearchBar(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onVerticalDragUpdate: onVerticalDragUpdate,
                    onVerticalDragEnd: (_) {
                      setState(() {
                        if (sheetHeight > 130) {
                          sheetHeight = 220;
                          isSheetExpanded = true;
                        } else {
                          sheetHeight = 100;
                          isSheetExpanded = false;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      height: sheetHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: 40,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Bottom Sheet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel dolor id lectus euismod sodales.',
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Suspendisse quis purus vel ante sagittis accumsan quis vitae tortor.',
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Nullam sit amet turpis nibh. In malesuada tristique ex, in fringilla lorem volutpat a.',
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
