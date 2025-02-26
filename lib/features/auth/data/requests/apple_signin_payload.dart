class AppleSignInPayload {
  final String appleId;
  final String email;
  final String role;

  AppleSignInPayload({
    required this.appleId,
    required this.email,
    required this.role,
  });

  factory AppleSignInPayload.fromJson(Map<String, dynamic> json) {
    return AppleSignInPayload(
      appleId: json['appleId'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appleId': appleId,
      'email': email,
      'role': role,
    };
  }
}
