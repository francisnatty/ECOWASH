// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginPayload {
  final String phone;
  final String password;

  LoginPayload({
    required this.phone,
    required this.password,
  });

  factory LoginPayload.fromJson(Map<String, dynamic> json) {
    return LoginPayload(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }

  @override
  String toString() => 'LoginPayload(phone: $phone, password: $password)';
}
