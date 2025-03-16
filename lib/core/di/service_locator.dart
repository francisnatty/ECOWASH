import 'package:ecowash/core/utils/local_storage.dart';
import 'package:ecowash/features/app/data/remote/collection_service.dart';
import 'package:ecowash/features/app/data/remote/geolocation_service.dart';
import 'package:ecowash/features/app/domain/geolocation_repo.dart';
import 'package:ecowash/features/app/presentation/sm/collection/bloc/collection_bloc.dart';
import 'package:ecowash/features/auth/domain/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/app/domain/collection_repo.dart';
import '../../features/auth/data/service/auth_service.dart';
import '../api/api.dart';

class Di {
  static late GetIt getIt;
  static Future<void> setUpLocator() async {
    getIt = GetIt.instance;
    initialize();
  }

  static void initialize() {
    initializePackages();
    initializeServices();
    initializeBloc();
    initializeLocalDataSources();
    initializeRepositories();
  }

  static void initializeServices() {
    getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
    getIt.registerLazySingleton<CollectionService>(
        () => CollectionServiceImpl());

    getIt.registerLazySingleton<GeolocationService>(
        () => GeolocationServiceImpl());
  }

  static void initializeBloc() {
    getIt.registerLazySingleton<CollectionBloc>(() => CollectionBloc());
  }

  static void initializeRepositories() {
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
    getIt.registerLazySingleton<CollectionRepo>(() => CollectionRepoImpl());
    getIt.registerLazySingleton<GeolocationRepo>(() => GeolocationRepoImpl());
  }

  static void initializeLocalDataSources() {}

  static void initializePackages() {
    getIt.registerLazySingleton<ApiClient>(
      () => DioClient(),
    );

    getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

    getIt.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());
  }
}
