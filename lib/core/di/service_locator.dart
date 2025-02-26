import 'package:ecowash/features/auth/domain/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/service/auth_service.dart';
import '../api/api.dart';

class Di {
  static late GetIt getIt;
  static Future<void> setUpLocator() async {
    getIt = GetIt.instance;
    initialize();
  }

  static void initialize() {
    initializeServices();
    initializeBloc();
    initializeLocalDataSources();
    initializeRepositories();
    initializePackages();
  }

  static void initializeServices() {
    getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  }

  static void initializeBloc() {}

  static void initializeRepositories() {
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  }

  static void initializeLocalDataSources() {}

  static void initializePackages() {
    getIt.registerLazySingleton<ApiClient>(
      () => DioClient(),
    );

    getIt.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());
  }
}
