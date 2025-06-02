import 'package:ecowash/core/utils/enums/enums.dart';
import 'package:ecowash/features/app/data/model/collection/collections_by_location.dart';
import 'package:ecowash/features/app/data/model/collection/get_collection_model.dart';

import '../../../../core/api/api.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/local_storage.dart';

abstract class CollectionService {
  Future<ApiResponse<GetCollectionModel>> getCollections();

  Future<ApiResponse<CollectionByLocation>> fetchByLocation(
      {required String locationId});
  Future<ApiResponse> fetchByVendor({required String vendorId});
  Future<ApiResponse> fetchByCollectionAndLocation(
      {required String collectionId, required String locationId});
}

class CollectionServiceImpl implements CollectionService {
  final apiClient = Di.getIt<ApiClient>();
  final localStorage = Di.getIt<LocalStorage>();

  @override
  Future<ApiResponse<GetCollectionModel>> getCollections() async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    print(token);
    final response = await apiClient.request(
        path: 'collections/list',
        method: MethodType.get,
        fromJsonT: (json) => GetCollectionModel.fromJson(json));

    return response;
  }

  @override
  Future<ApiResponse> fetchByCollectionAndLocation(
      {required String collectionId, required String locationId}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    final response = await apiClient.request(
      path: 'collections/collection/$collectionId/location/$locationId',
      method: MethodType.get,
    );

    return response;
  }

  @override
  Future<ApiResponse<CollectionByLocation>> fetchByLocation(
      {required String locationId}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    final response = await apiClient.request(
      path: 'collections/location/$locationId',
      method: MethodType.get,
      fromJsonT: (json) => CollectionByLocation.fromJson(json),
    );

    return response;
  }

  @override
  Future<ApiResponse> fetchByVendor({required String vendorId}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    final response = await apiClient.request(
      path: 'collections/vendor/$vendorId',
      method: MethodType.get,
      // fromJsonT: (json) => CollectionByLocation.fromJson(json),
    );

    return response;
  }
}
