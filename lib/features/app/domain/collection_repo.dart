import 'package:dartz/dartz.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/utils/local_storage.dart';
import '../../../core/utils/utils.dart';
import '../data/model/collection/create_collection_payload.dart';
import '../data/model/collection/get_collection_model.dart';
import '../data/remote/collection_service.dart';

abstract class CollectionRepo {
  ApiResult<GetCollectionModel> getCollections();
  ApiResult<String> createCollections({required CreateCollectionModel payload});
  ApiResult<String> updateCollection({required String id});
  ApiResult<String> deleteCollection({required String id});
}

class CollectionRepoImpl implements CollectionRepo {
  final collectionService = Di.getIt<CollectionService>();

  @override
  ApiResult<String> createCollections(
      {required CreateCollectionModel payload}) async {
    final response =
        await collectionService.createCollections(payload: payload);
    DebugLogger.log('Create Collection', response.rawJson);
    if (response.success!) {
      final message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> deleteCollection({required String id}) async {
    final response = await collectionService.deleteCollection(id: id);
    DebugLogger.log('Delete Collection', response.rawJson);
    if (response.success!) {
      final message = response.rawJson['message'];
      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<GetCollectionModel> getCollections() async {
    final response = await collectionService.getCollections();
    DebugLogger.log('Get Collection', response.rawJson);
    if (response.success!) {
      return Right(response.data!);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<String> updateCollection({required String id}) async {
    final response = await collectionService.getCollections();
    DebugLogger.log('Update Collection', response.rawJson);
    if (response.success!) {
      final message = response.rawJson['message'];

      return Right(message);
    } else {
      return Left(response.failure!);
    }
  }
}
