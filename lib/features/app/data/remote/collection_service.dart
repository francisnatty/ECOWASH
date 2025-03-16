import 'package:ecowash/core/utils/enums/enums.dart';
import 'package:ecowash/features/app/data/model/collection/get_collection_model.dart';

import '../../../../core/api/api.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/local_storage.dart';
import '../model/collection/create_collection_payload.dart';

abstract class CollectionService {
  Future<ApiResponse<GetCollectionModel>> getCollections();
  Future<ApiResponse> createCollections(
      {required CreateCollectionModel payload});
  Future<ApiResponse> updateCollection({required String id});
  Future<ApiResponse> deleteCollection({required String id});
}

class CollectionServiceImpl implements CollectionService {
  final apiClient = Di.getIt<ApiClient>();
  final localStorage = Di.getIt<LocalStorage>();

  @override
  Future<ApiResponse> createCollections(
      {required CreateCollectionModel payload}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    final response = await apiClient.request(
      path: 'collection/create',
      method: MethodType.post,
      payload: payload.toJson(),
    );

    return response;
  }

  @override
  Future<ApiResponse> deleteCollection({required String id}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    final response = await apiClient.request(
      path: 'collection/delete/$id',
      method: MethodType.delete,
    );

    return response;
  }

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
  Future<ApiResponse> updateCollection({required String id}) async {
    String? token = await localStorage.getAcessToken();
    apiClient.setToken(token!);
    final response = await apiClient.request(
      path: 'collection/update-status',
      method: MethodType.put,
    );

    return response;
  }
}
