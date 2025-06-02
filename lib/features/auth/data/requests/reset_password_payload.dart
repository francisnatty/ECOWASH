class ResetPasswordPayload {
  final String token;
  final String confirmPassword;
  final String newPassword;

  ResetPasswordPayload({
    required this.token,
    required this.confirmPassword,
    required this.newPassword,
  });

  factory ResetPasswordPayload.fromJson(Map<String, dynamic> json) {
    return ResetPasswordPayload(
      token: json['token'] as String,
      confirmPassword: json['confirmPassword'] as String,
      newPassword: json['newPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'newPassword': confirmPassword,
      'confirmPassword': newPassword,
    };
  }
}
