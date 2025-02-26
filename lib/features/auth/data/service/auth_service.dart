import 'package:ecowash/core/api/api_endpoints.dart';
import 'package:ecowash/core/api/response/api_response.dart';
import 'package:ecowash/core/utils/enums/enums.dart';

import '../../../../core/api/api.dart';
import '../../../../core/di/service_locator.dart';
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
  //final localStorage = Di.getIt<LocalStorage>();
  // final apiRequest=
  @override
  Future<ApiResponse> appleSignIn({required AppleSignInPayload payload}) {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> changePassword({required ChangePasswordPayload payload}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> googleSigIn({required GoogleSigInPayload payload}) {
    // TODO: implement googleSigIn
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> login({required LoginPayload payload}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> phoneSignIn({required PhoneSignInPayload paylad}) async {
    final response = await apiClient.request(
      path: ApiEndpoints.phoneSignup,
      method: MethodType.post,
    );

    return response;
  }

  @override
  Future<ApiResponse> sendOtp({required String phone}) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> verifyOtp({required String phone, required String code}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
