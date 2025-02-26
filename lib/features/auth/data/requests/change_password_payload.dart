class ChangePasswordPayload {
  final String userId;
  final String oldPassword;
  final String newPassword;

  ChangePasswordPayload({
    required this.userId,
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordPayload.fromJson(Map<String, dynamic> json) {
    return ChangePasswordPayload(
      userId: json['userId'] as String,
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}
