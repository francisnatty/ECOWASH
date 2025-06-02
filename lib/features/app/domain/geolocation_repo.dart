import 'package:dartz/dartz.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/features/app/data/remote/geolocation_service.dart';

import '../../../core/di/service_locator.dart';
import '../data/model/geolocation/supported_location_models.dart';
import '../data/model/geolocation/update_location.dart';

abstract class GeolocationRepo {
  ApiResult<String> getCurrentLocation();
  ApiResult<String> getLocationHistory();
  ApiResult<String> updateLocation({required LocationPayload payload});
  ApiResult<SupportedLocationModel> getSupportedLocations();
  ApiResult<String> checkIfLocationIsSupported();
}

class GeolocationRepoImpl implements GeolocationRepo {
  final service = Di.getIt<GeolocationService>();
  @override
  ApiResult<String> checkIfLocationIsSupported() {
    // TODO: implement getCurrentLocation
    throw UnimplementedError();
  }

  @override
  ApiResult<String> getCurrentLocation() {
    // TODO: implement getCurrentLocation
    throw UnimplementedError();
  }

  @override
  ApiResult<String> getLocationHistory() {
    // TODO: implement getLocationHistory
    throw UnimplementedError();
  }

  @override
  ApiResult<SupportedLocationModel> getSupportedLocations() async {
    final response = await service.getSupportedLocations();
    DebugLogger.log('', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      return Right(response.data!);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> updateLocation({required LocationPayload payload}) async {
    final response = await service.updateLocation(payload: payload);
    DebugLogger.log('Update Location', response.rawJson);
    if (response.success!) {
      final String message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }
}
