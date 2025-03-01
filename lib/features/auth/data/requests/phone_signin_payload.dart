// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhoneSignInPayload {
  final String phone;
  final String password;
  final String role;

  PhoneSignInPayload({
    required this.phone,
    required this.password,
    required this.role,
  });

  // factory UserAuth.fromJson(Map<String, dynamic> json) {
  //   return UserAuth(
  //     phone: json['phone'] as String,
  //     password: json['password'] as String,
  //     role: json['role'] as String,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'role': role,
    };
  }

  @override
  String toString() =>
      'PhoneSignInPayload(phone: $phone, password: $password, role: $role)';
}
