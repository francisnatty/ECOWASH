import 'package:ecowash/core/di/service_locator.dart';
import 'package:ecowash/core/widgets/loading_dialog.dart';
import 'package:ecowash/features/auth/data/requests/phone_signin_payload.dart';
import 'package:ecowash/features/auth/domain/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  }) async {}

  Future<void> phoneSignIn({
    required BuildContext context,
    required PhoneSignInPayload payload,
  }) async {
    _setLoading(true);
    LoadingDialog.show(context);
    Future.delayed(Duration(seconds: 1));
    LoadingDialog.hide(context);
    //  final response = await authRepo.phoneSignIn(payload: payload);
    // response.fold(
    //   (failure) {},
    //   (success) {},
    // );
  }
}
