// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecowash/core/utils/logger/debug_logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignInService _instance = GoogleSignInService._internal();

  factory GoogleSignInService() => _instance;
  GoogleSignInService._internal();

  //signin instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
    //  clientId: '****.apps.googleusercontent.com',
  );

  //
  Future<GoogleSignInResult> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        DebugLogger.log('Google SignIn', 'null');
        return GoogleSignInResult(
            success: false, message: 'Sign in was cancelled', payload: null);
      }

      final String email = googleUser.email;
      final String googleId = googleUser.id;

      final payload = _GoogleSigInPayload(googleId: googleId, email: email);

      return GoogleSignInResult(
        success: true,
        message: 'Google sign in successful',
        payload: payload,
      );
    } catch (e) {
      return GoogleSignInResult(
        success: false,
        message: 'Error during sign in: $e',
        payload: null,
      );
    }
  }

  Future<bool> signOut() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}

class GoogleSignInResult {
  final bool success;
  final String message;
  final _GoogleSigInPayload? payload;
  GoogleSignInResult({
    required this.success,
    required this.message,
    this.payload,
  });
}

class _GoogleSigInPayload {
  final String googleId;
  final String email;

  _GoogleSigInPayload({
    required this.googleId,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'googleId': googleId,
      'email': email,
    };
  }
}
