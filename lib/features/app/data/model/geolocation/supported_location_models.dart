// location_response.dart

class SupportedLocationModel {
  final bool success;
  final String message;
  final LocationData data;
  final String timestamp;

  SupportedLocationModel({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory SupportedLocationModel.fromJson(Map<String, dynamic> json) {
    return SupportedLocationModel(
      success: json['success'],
      message: json['message'],
      data: LocationData.fromJson(json['data']),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
      'timestamp': timestamp,
    };
  }
}

class LocationData {
  final bool supported;
  final String message;
  final LocationDetails? location;

  LocationData({
    required this.supported,
    required this.message,
    this.location,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      supported: json['supported'],
      message: json['message'],
      location: json['supported'] && json.containsKey('location')
          ? LocationDetails.fromJson(json['location'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'supported': supported,
      'message': message,
    };
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class LocationDetails {
  final int id;
  final String locationId;
  final String address;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final int vatRate;
  final int flatRate;
  final int kmRange;
  final String createdAt;
  final String updatedAt;

  LocationDetails({
    required this.id,
    required this.locationId,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.vatRate,
    required this.flatRate,
    required this.kmRange,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return LocationDetails(
      id: json['id'],
      locationId: json['locationId'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      vatRate: json['vatRate'],
      flatRate: json['flatRate'],
      kmRange: json['kmRange'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'locationId': locationId,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'vatRate': vatRate,
      'flatRate': flatRate,
      'kmRange': kmRange,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
