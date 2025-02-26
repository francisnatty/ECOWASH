class GoogleSigInPayload {
  final String googleId;
  final String email;
  final String role;

  GoogleSigInPayload({
    required this.googleId,
    required this.email,
    required this.role,
  });

  factory GoogleSigInPayload.fromJson(Map<String, dynamic> json) {
    return GoogleSigInPayload(
      googleId: json['googleId'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'googleId': googleId,
      'email': email,
      'role': role,
    };
  }
}
