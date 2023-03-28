import 'package:geolocator/geolocator.dart';

String? token;
String? otpCodeFromShared;
String? langCode = '';
int? langContainerIndex = 0;
bool isDark = false;
const String googleApiKey = "AIzaSyDUNaxTG6FDCGz51xE-Uc9ZoEAbHsawv8M";
Position? currentLocation;
String? currentLocationAsString;
double? currentLatitude = currentLocation!.latitude;
double? currentLongitude = currentLocation!.longitude;
