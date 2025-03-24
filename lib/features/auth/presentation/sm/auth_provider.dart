import 'package:ecowash/core/di/service_locator.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/loading_dialog.dart';
import 'package:ecowash/features/app/presentation/pages/nav.dart';
import 'package:ecowash/features/auth/data/requests/phone_signin_payload.dart';
import 'package:ecowash/features/auth/domain/auth_repo.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/otp_verification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/animations/transition_animations.dart';
import '../../../app/presentation/pages/profile/screens/change_password.dart';
import '../../data/requests/apple_signin_payload.dart';
import '../../data/requests/change_password_payload.dart';
import '../../data/requests/google_signin_payload.dart';
import '../../data/requests/login_payload.dart';

class AuthProvider extends ChangeNotifier {
  final authRepo = Di.getIt<AuthRepo>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login({
    required BuildContext context,
    required LoginPayload payload,
  }) async {
    LoadingDialog.show(context);
    final response = await authRepo.login(payload: payload);
    response.fold((failure) {
      LoadingDialog.hide(context);
      ToastUtil.show(
        context,
        message: failure.message,
        toastType: ToastType.error,
      );
    }, (successMsg) {
      LoadingDialog.hide(context);
      ToastUtil.show(
        context,
        message: successMsg,
        toastType: ToastType.success,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          AppPageRoute(
            page: const HomeNav(),
            transitionType: TransitionType.slideFromRight,
          ),
        );
      });
    });
  }

  Future<void> verifyOtp(
      {required BuildContext context,
      required String phone,
      required String otp}) async {
    LoadingDialog.show(context);
    final response = await authRepo.verifyOtp(phone: phone, otp: otp);
    response.fold((failure) {
      LoadingDialog.hide(context);
      ToastUtil.show(
        context,
        message: failure.message,
        toastType: ToastType.error,
      );
    }, (successMsg) {
      LoadingDialog.hide(context);
      ToastUtil.show(
        context,
        message: successMsg,
        toastType: ToastType.success,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          AppPageRoute(
            page: const HomeNav(),
            transitionType: TransitionType.slideFromRight,
          ),
        );
      });
    });
  }

  Future<void> phoneSignIn({
    required BuildContext context,
    required PhoneSignInPayload payload,
  }) async {
    _setLoading(true);
    LoadingDialog.show(context);

    final response = await authRepo.phoneSignUp(payload: payload);
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            AppPageRoute(
              page: OtpVerificationScreen(
                phoneNumber: payload.phone,
              ),
              transitionType: TransitionType.slideFromRight,
            ),
          );
          // goTo(
          //   context: context,
          //   newScreen: const OtpVerificationScreen(),
          // );
        });
      },
    );
  }

  Future<void> googleSignUp(
      {required BuildContext context,
      required GoogleSigInPayload payload}) async {
    LoadingDialog.show(context);
    final response = await authRepo.googleSignUp(payload: payload);
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          goToAndRemove(
            context: context,
            newScreen: const HomeNav(),
          );
        });
      },
    );
  }

  Future<void> googleSignIn(
      {required BuildContext context, required String googleIdToken}) async {
    LoadingDialog.show(context);
    final response = await authRepo.googleSignIn(googleIdToken: googleIdToken);
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          goToAndRemove(
            context: context,
            newScreen: const HomeNav(),
          );
        });
      },
    );
  }

  Future<void> appleSignUp(
      {required BuildContext context,
      required AppleSignInPayload payload}) async {}
  Future<void> changePassword(
      {required BuildContext context,
      required ChangePasswordPayload payload}) async {
    LoadingDialog.show(context);
  }
}
