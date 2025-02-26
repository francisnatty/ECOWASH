import '../../../core/utils/utils.dart';
import '../data/requests/apple_signin_payload.dart';
import '../data/requests/change_password_payload.dart';
import '../data/requests/google_signin_payload.dart';
import '../data/requests/login_payload.dart';
import '../data/requests/phone_signin_payload.dart';

abstract class AuthRepo {
  ApiResult<bool> phoneSignIn({required PhoneSignInPayload payload});
  ApiResult<bool> googleSigIn({required GoogleSigInPayload payload});
  ApiResult<bool> appleSignIn({required AppleSignInPayload payload});
  ApiResult<bool> login({required LoginPayload payload});
  ApiResult<bool> changePassword({required ChangePasswordPayload payload});
  ApiResult<bool> verifyOtp({required String phone, required String code});
  ApiResult<bool> sendOtp({required String phone});
}

class AuthRepoImpl implements AuthRepo {
  @override
  ApiResult<bool> appleSignIn({required AppleSignInPayload payload}) {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  ApiResult<bool> changePassword({required ChangePasswordPayload payload}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  ApiResult<bool> googleSigIn({required GoogleSigInPayload payload}) {
    // TODO: implement googleSigIn
    throw UnimplementedError();
  }

  @override
  ApiResult<bool> login({required LoginPayload payload}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  ApiResult<bool> phoneSignIn({required PhoneSignInPayload payload}) {
    // TODO: implement phoneSignIn
    throw UnimplementedError();
  }

  @override
  ApiResult<bool> sendOtp({required String phone}) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

  @override
  ApiResult<bool> verifyOtp({required String phone, required String code}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
