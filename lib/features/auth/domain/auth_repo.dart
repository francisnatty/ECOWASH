import 'package:dartz/dartz.dart';
import 'package:ecowash/features/auth/data/service/auth_service.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/utils/local_storage.dart';
import '../../../core/utils/utils.dart';
import '../data/requests/apple_signin_payload.dart';
import '../data/requests/change_password_payload.dart';
import '../data/requests/google_signin_payload.dart';
import '../data/requests/login_payload.dart';
import '../data/requests/phone_signin_payload.dart';

abstract class AuthRepo {
  ApiResult<String> phoneSignUp({required PhoneSignInPayload payload});
  ApiResult<String> googleSignUp({required GoogleSigInPayload payload});
  ApiResult<bool> appleSignUp({required AppleSignInPayload payload});

  ApiResult<String> googleSignIn({required String googleIdToken});
  ApiResult<String> apppleSignIn({required String appleIdToken});

  ApiResult<String> login({required LoginPayload payload});
  ApiResult<String> changePassword({required ChangePasswordPayload payload});
  ApiResult<String> verifyOtp({required String phone, required String otp});
  ApiResult<bool> sendOtp({required String phone});
}

class AuthRepoImpl implements AuthRepo {
  final authService = Di.getIt<AuthService>();
  final localStorage = Di.getIt<LocalStorage>();

  @override
  ApiResult<bool> appleSignUp({required AppleSignInPayload payload}) async {
    throw UnimplementedError();
  }

  @override
  ApiResult<String> changePassword(
      {required ChangePasswordPayload payload}) async {
    final response = await authService.changePassword(payload: payload);
    DebugLogger.log('Change Password', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> googleSignUp({required GoogleSigInPayload payload}) async {
    final response = await authService.googleSignUp(payload: payload);
    DebugLogger.log('GoogleSignIn', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      await localStorage.saveAcessToken(response.rawJson['data']['token']);
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> login({required LoginPayload payload}) async {
    final response = await authService.login(payload: payload);
    DebugLogger.log('Login', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      await localStorage.saveAcessToken(response.rawJson['data']['token']);
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> phoneSignUp({required PhoneSignInPayload payload}) async {
    final response = await authService.phoneSignUp(paylad: payload);
    DebugLogger.log('PhoneSignIn', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<bool> sendOtp({required String phone}) {
    throw UnimplementedError();
  }

  @override
  ApiResult<String> verifyOtp(
      {required String phone, required String otp}) async {
    final response = await authService.verifyOtp(phone: phone, code: otp);
    DebugLogger.log('VERIFY OTP', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> apppleSignIn({required String appleIdToken}) async {
    final response = await authService.apppleSignIn(appleIdToken: appleIdToken);
    DebugLogger.log('APPLE SIGNIN API', response.rawJson);

    if (response.success!) {
      final String message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> googleSignIn({required String googleIdToken}) async {
    final response =
        await authService.googleSignIn(googleIdToken: googleIdToken);
    DebugLogger.log('GOOGLE SIGNIN API', response.rawJson);

    if (response.success!) {
      final String message = response.rawJson['message'];
      await localStorage.saveAcessToken(response.rawJson['data']['token']);
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }
}
