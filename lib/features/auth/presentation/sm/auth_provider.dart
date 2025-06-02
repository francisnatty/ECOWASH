import 'package:ecowash/features/app/presentation/pages/profile/screens/change_password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:ecowash/core/di/service_locator.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/loading_dialog.dart';
import 'package:ecowash/features/app/presentation/pages/nav.dart';
import 'package:ecowash/features/auth/data/requests/phone_signin_payload.dart';
import 'package:ecowash/features/auth/domain/auth_repo.dart';
import 'package:ecowash/features/auth/presentation/pages/login/login.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/otp_verification.dart';
import 'package:ecowash/core/utils/animations/transition_animations.dart';

import '../../data/requests/apple_signin_payload.dart';
import '../../data/requests/change_password_payload.dart';
import '../../data/requests/google_signin_payload.dart';
import '../../data/requests/login_payload.dart';
import '../../data/requests/reset_password_payload.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo _authRepo = Di.getIt<AuthRepo>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _handleAuthResponse({
    required BuildContext context,
    required dynamic response,
    required VoidCallback onSuccess,
  }) {
    response.fold(
      (failure) {
        LoadingDialog.hide(context);
        ToastUtil.show(
          context,
          message: failure.message,
          toastType: ToastType.error,
        );
      },
      (successMsg) {
        LoadingDialog.hide(context);
        ToastUtil.show(
          context,
          message: successMsg,
          toastType: ToastType.success,
        );
        WidgetsBinding.instance.addPostFrameCallback((_) => onSuccess());
      },
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      AppPageRoute(
        page: page,
        transitionType: TransitionType.slideFromRight,
      ),
    );
  }

  void _navigateToAndRemove(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      AppPageRoute(
        page: page,
        transitionType: TransitionType.slideFromRight,
      ),
      (route) => false, 
    );
  }

  Future<void> login({
    required BuildContext context,
    required LoginPayload payload,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.login(payload: payload);
    if (!context.mounted) return;
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateTo(context, const HomeNav()),
    );
  }

  Future<void> verifyOtp({
    required BuildContext context,
    required String phone,
    required String otp,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.verifyOtp(phone: phone, otp: otp);
    if (!context.mounted) return;
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateTo(context, const HomeNav()),
    );
  }

  Future<void> phoneSignIn({
    required BuildContext context,
    required PhoneSignInPayload payload,
  }) async {
    _setLoading(true);
    LoadingDialog.show(context);

    final response = await _authRepo.phoneSignUp(payload: payload);
    if (!context.mounted) return;
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateTo(
        context,
        OtpVerificationScreen(phoneNumber: payload.phone),
      ),
    );
  }

  Future<void> googleSignUp({
    required BuildContext context,
    required GoogleSigInPayload payload,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.googleSignUp(payload: payload);
    if (!context.mounted) return;
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateToAndRemove(context, const HomeNav()),
    );
  }

  Future<void> googleSignIn({
    required BuildContext context,
    required String googleIdToken,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.googleSignIn(googleIdToken: googleIdToken);
    if (!context.mounted) return;
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateToAndRemove(context, const HomeNav()),
    );
  }

  Future<void> forgotPassword({
    required BuildContext context,
    required String number,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.forgotPassword(phoneNumber: number);
    if (!context.mounted) return;
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () {}, // No additional action needed
    );
  }

  Future<void> verifyResetOtp({
    required BuildContext context,
    required String number,
    required String otp,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.verifyReseyOtp(number: number, otp: otp);
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateTo(
        context,
        ChangePassword(),
      ), // Commented out navigation in original code
    );
  }

  Future<void> resetPassword({
    required BuildContext context,
    required ResetPasswordPayload payload,
  }) async {
    LoadingDialog.show(context);
    final response = await _authRepo.resetPassword(payload: payload);
    _handleAuthResponse(
      context: context,
      response: response,
      onSuccess: () => _navigateTo(context, const LoginScreen()),
    );
  }

  // Placeholder for changePassword - needs implementation
  Future<void> changePassword({
    required BuildContext context,
    required ChangePasswordPayload payload,
  }) async {
    LoadingDialog.show(context);
    // TODO: Implement change password logic
    LoadingDialog.hide(context);
  }

  // Placeholder for appleSignUp - was empty in original code
  Future<void> appleSignUp({
    required BuildContext context,
    required AppleSignInPayload payload,
  }) async {
    // TODO: Implement Apple sign-up logic
  }
}
