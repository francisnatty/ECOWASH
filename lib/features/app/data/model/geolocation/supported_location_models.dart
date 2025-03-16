class SupportedLocationsModel {
  final bool success;
  final String message;
  final List<LocationData> data;

  SupportedLocationsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SupportedLocationsModel.fromJson(Map<String, dynamic> json) {
    return SupportedLocationsModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((location) => LocationData.fromJson(location))
          .toList(),
    );
  }
}

class LocationData {
  final int id;
  final String locationId;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;

  LocationData({
    required this.id,
    required this.locationId,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      id: json['id'],
      locationId: json['locationId'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}
