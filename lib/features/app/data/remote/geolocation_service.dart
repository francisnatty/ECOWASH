import 'package:ecowash/core/utils/enums/enums.dart';

import '../../../../core/api/api.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/local_storage.dart';
import '../model/geolocation/supported_location_models.dart';
import '../model/geolocation/update_location.dart';

abstract class GeolocationService {
  Future<ApiResponse> getCurrentLocation();
  Future<ApiResponse> getLocationHistory();
  Future<ApiResponse> updateLocation({required LocationPayload payload});
  Future<ApiResponse<SupportedLocationsModel>> getSupportedLocations();
  Future<ApiResponse> checkIfLocationIsSupported();
}

class GeolocationServiceImpl implements GeolocationService {
  final apiClient = Di.getIt<ApiClient>();
  final localStorage = Di.getIt<LocalStorage>();
  @override
  Future<ApiResponse> getCurrentLocation() {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getLocationHistory() {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> updateLocation({required LocationPayload payload}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);

    final response = await apiClient.request(
      path: 'location/update',
      method: MethodType.post,
      payload: payload.toJson(),
    );
    return response;
  }

  @override
  Future<ApiResponse<SupportedLocationsModel>> getSupportedLocations() async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);

    final response = await apiClient.request(
      path: 'location/supported',
      method: MethodType.get,
      fromJsonT: (json) => SupportedLocationsModel.fromJson(json),
    );

    return response;
  }

  @override
  Future<ApiResponse> checkIfLocationIsSupported() {
    throw UnimplementedError();
  }
}
