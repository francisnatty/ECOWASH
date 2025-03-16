// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_ipify/dart_ipify.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }
  LocationService._internal();

  Future<Position> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Prompt the user to enable location services
      await Geolocator.openLocationSettings();
      throw Exception("Location services are disabled. Please enable them.");
    }

    // Check the current location permission status
    LocationPermission permission = await Geolocator.checkPermission();

    // If permission is denied, request permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    // If permission is denied forever, we cannot request permission again
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");
    }

    // If permissions are granted, get the current location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getIpAddress() async {
    return await Ipify.ipv4();
  }

  Future<LocationDetails> getLocationDetails(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;

      return LocationDetails(
        city: place.locality ?? 'Unknown',
        state: place.administrativeArea ?? 'Unknown',
        country: place.country ?? 'Unknown',
      );
    }

    return LocationDetails(
      city: 'Unknown',
      state: 'Unknown',
      country: 'Unknown',
    );
  }
}

class LocationDetails {
  final String city;
  final String state;
  final String country;
  LocationDetails({
    required this.city,
    required this.state,
    required this.country,
  });

  @override
  String toString() =>
      'LocationDetails(city: $city, state: $state, country: $country)';
}
