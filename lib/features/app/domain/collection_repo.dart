import 'package:dartz/dartz.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/utils/local_storage.dart';
import '../../../core/utils/utils.dart';
import '../data/model/collection/collections_by_location.dart';
import '../data/model/collection/create_collection_payload.dart';
import '../data/model/collection/get_collection_model.dart';
import '../data/remote/collection_service.dart';

abstract class CollectionRepo {
  ApiResult<GetCollectionModel> getCollections();
  ApiResult<CollectionByLocation> fetchByLocation({required String locationId});
  ApiResult<bool> fetchByVendor({required String vendorId});
  ApiResult<bool> fetchByCollectionAndLocation(
      {required String collectionId, required String locationId});
}

class CollectionRepoImpl implements CollectionRepo {
  final collectionService = Di.getIt<CollectionService>();

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
  ApiResult<bool> fetchByCollectionAndLocation(
      {required String collectionId, required String locationId}) async {
    final response = await collectionService.fetchByCollectionAndLocation(
      collectionId: collectionId,
      locationId: locationId,
    );

    if (response.success!) {
      return Right(response.data);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<CollectionByLocation> fetchByLocation(
      {required String locationId}) async {
    final response =
        await collectionService.fetchByLocation(locationId: locationId);

    if (response.success!) {
      return Right(response.data!);
    } else {
      return Left(response.failure!);
    }
  }

  @override
  ApiResult<bool> fetchByVendor({required String vendorId}) async {
    final response = await collectionService.fetchByVendor(vendorId: vendorId);
    if (response.success!) {
      return Right(response.data);
    } else {
      return Left(response.failure!);
    }
  }
}
