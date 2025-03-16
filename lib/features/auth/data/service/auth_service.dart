import 'package:ecowash/core/api/api_endpoints.dart';
import 'package:ecowash/core/api/response/api_response.dart';
import 'package:ecowash/core/utils/enums/enums.dart';

import '../../../../core/api/api.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/local_storage.dart';
import '../requests/apple_signin_payload.dart';
import '../requests/change_password_payload.dart';
import '../requests/google_signin_payload.dart';
import '../requests/login_payload.dart';
import '../requests/phone_signin_payload.dart';

abstract class AuthService {
  Future<ApiResponse> phoneSignIn({required PhoneSignInPayload paylad});
  Future<ApiResponse> googleSigIn({required GoogleSigInPayload payload});
  Future<ApiResponse> appleSignIn({required AppleSignInPayload payload});
  Future<ApiResponse> login({required LoginPayload payload});
  Future<ApiResponse> changePassword({required ChangePasswordPayload payload});
  Future<ApiResponse> verifyOtp({required String phone, required String code});
  Future<ApiResponse> sendOtp({required String phone});
}

class AuthServiceImpl implements AuthService {
  final apiClient = Di.getIt<ApiClient>();
  final localStorage = Di.getIt<LocalStorage>();
  // final apiRequest=
  @override
  Future<ApiResponse> appleSignIn({required AppleSignInPayload payload}) async {
    final response = await apiClient.request(
      path: ApiEndpoints.appleSigning,
      method: MethodType.post,
    );

    return response;
  }

  @override
  Future<ApiResponse> changePassword(
      {required ChangePasswordPayload payload}) async {
    final response = await apiClient.request(
        path: ApiEndpoints.changePassword,
        method: MethodType.post,
        payload: payload.toJson());

    return response;
  }

  @override
  Future<ApiResponse> googleSigIn({required GoogleSigInPayload payload}) async {
    final response = await apiClient.request(
      path: ApiEndpoints.googleSignin,
      method: MethodType.post,
      payload: payload.toJson(),
    );
    print(response.data);

    return response;
  }

  @override
  Future<ApiResponse> login({required LoginPayload payload}) async {
    final response = await apiClient.request(
      path:
          'https://echowash-backend-966541614788.us-central1.run.app/auth/login',
      method: MethodType.post,
      payload: payload.toJson(),
    );

    return response;
  }

  @override
  Future<ApiResponse> phoneSignIn({required PhoneSignInPayload paylad}) async {
    final response = await apiClient.request(
      path: ApiEndpoints.phoneSignup,
      method: MethodType.post,
      payload: paylad.toJson(),
    );

    return response;
  }

  @override
  Future<ApiResponse> sendOtp({required String phone}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> verifyOtp(
      {required String phone, required String code}) async {
    final response = await apiClient.request(
        path: ApiEndpoints.verifyOtp,
        method: MethodType.post,
        payload: {
          'phone': phone,
          'otp': code,
        });

    print(response.data);

    return response;
  }
}
