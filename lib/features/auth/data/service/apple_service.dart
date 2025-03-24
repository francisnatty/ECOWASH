import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/utils/utils.dart';

class AppleSignInService {
  static final AppleSignInService _instance = AppleSignInService._internal();

  factory AppleSignInService() => _instance;
  AppleSignInService._internal();

  Future<AppleSignUpResult> signUp() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Apple might return a null email if the user has previously hidden it
      final String email = credential.email ?? '';
      final String appleId = credential.userIdentifier ?? '';

      final payload = _AppleSignUpPayload(appleId: appleId, email: email);

      return AppleSignUpResult(
        success: true,
        message: 'Apple sign in successful',
        payload: payload,
      );
    } catch (e) {
      return AppleSignUpResult(
        success: false,
        message: 'Error during sign in: $e',
        payload: null,
      );
    }
  }

  Future<String> signIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final String? idToken = credential.identityToken;

      if (idToken == null) {
        // DebugLogger.log
        DebugLogger.log('Apple SignIn', 'Failed to get ID token');
        return '';
      }

      DebugLogger.log('Apple SignIn', idToken);

      return idToken;
    } catch (e) {
      if (e is SignInWithAppleAuthorizationException) {
        // Handle specific Apple sign-in cancellation
        if (e.code == AuthorizationErrorCode.canceled) {
          DebugLogger.log('Apple SignIn', 'Sign in was cancelled');
        } else {
          DebugLogger.log('Apple SignIn', 'Error during sign in: $e');
        }
      } else {
        DebugLogger.log('Apple SignIn', 'Unexpected error: $e');
      }
      return '';
    }
  }

  Future<bool> signOut() async {
    // Apple doesn't provide a sign-out method
    // You typically just forget the credentials on your end
    return true;
  }
}

class AppleSignUpResult {
  final bool success;
  final String message;
  final _AppleSignUpPayload? payload;
  AppleSignUpResult({
    required this.success,
    required this.message,
    this.payload,
  });
}

class _AppleSignUpPayload {
  final String appleId;
  final String email;

  _AppleSignUpPayload({
    required this.appleId,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'appleId': appleId,
      'email': email,
    };
  }
}
