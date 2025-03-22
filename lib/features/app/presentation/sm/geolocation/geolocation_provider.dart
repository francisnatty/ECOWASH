import 'package:ecowash/core/utils/snackbar/snackbar.dart';
import 'package:ecowash/features/app/domain/geolocation_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../data/model/geolocation/update_location.dart';

class GeolocationProvider extends ChangeNotifier {
  final geoRepo = Di.getIt<GeolocationRepo>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> updateLocation(
      {required BuildContext context, required LocationPayload payload}) async {
    final response = await geoRepo.updateLocation(payload: payload);
    response.fold((failure) {
      ToastUtil.show(
        context,
        message: failure.message,
        toastType: ToastType.error,
      );
    }, (success) {
      ToastUtil.show(
        context,
        message: success,
        toastType: ToastType.success,
      );
      //  print(success);
    });
  }
}
