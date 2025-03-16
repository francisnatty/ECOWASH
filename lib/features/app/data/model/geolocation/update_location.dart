// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationPayload {
  final String userId;
  final double latitude;
  final double longitude;
  final String city;
  final String state;
  final String country;
  final String deviceName;
  final String ip;

  LocationPayload({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.state,
    required this.country,
    required this.deviceName,
    required this.ip,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "latitude": latitude,
      "longitude": longitude,
      "city": city,
      "state": state,
      "country": country,
      "deviceName": deviceName,
      "ip": ip,
    };
  }

  @override
  String toString() {
    return 'LocationPayload(userId: $userId, latitude: $latitude, longitude: $longitude, city: $city, state: $state, country: $country, deviceName: $deviceName, ip: $ip)';
  }
}
