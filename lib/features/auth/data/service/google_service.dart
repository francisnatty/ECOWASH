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
  Future<GoogleSignUpResult> signUp() async {
    try {
      // Force account selection by logging out first
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        DebugLogger.log('Google SignIn', 'null');
        return GoogleSignUpResult(
            success: false, message: 'Sign in was cancelled', payload: null);
      }

      final String email = googleUser.email;
      final String googleId = googleUser.id;

      final payload = _GoogleSignUpPayload(googleId: googleId, email: email);

      return GoogleSignUpResult(
        success: true,
        message: 'Google sign in successful',
        payload: payload,
      );
    } catch (e) {
      return GoogleSignUpResult(
        success: false,
        message: 'Error during sign in: $e',
        payload: null,
      );
    }
  }

  Future<String> signIn() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        DebugLogger.log('Google SignIn', 'Sign in was cancelled');
        return '';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? idToken = googleAuth.idToken;
      if (idToken == null) {
        DebugLogger.log('Google SignIn', 'Failed to get ID token');
        return '';
      }

      DebugLogger.log('Google SignIn', idToken);

      return idToken;
    } catch (e) {
      DebugLogger.log('Google SignIn', 'Error during sign in: $e');
      return '';
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

class GoogleSignUpResult {
  final bool success;
  final String message;
  final _GoogleSignUpPayload? payload;
  GoogleSignUpResult({
    required this.success,
    required this.message,
    this.payload,
  });
}

class _GoogleSignUpPayload {
  final String googleId;
  final String email;

  _GoogleSignUpPayload({
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
