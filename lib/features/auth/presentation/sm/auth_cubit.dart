import 'package:bloc/bloc.dart';
import 'package:ecowash/core/di/service_locator.dart';

import '../../../../core/utils/local_storage.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LocalStorage localStorage = Di.getIt<LocalStorage>();

  AuthCubit() : super(const AuthState());

  // Check authentication status
  Future<void> checkAuthStatus() async {
    final accessToken = await localStorage.getAcessToken();
    final refreshToken = await localStorage.getRefreshToken();

    if (accessToken != null) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        accessToken: accessToken,
        refreshToken: refreshToken,
      ));
    } else {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        accessToken: null,
        refreshToken: null,
      ));
    }
  }

  // Login method
  Future<void> login(
      {required String accessToken, required String refreshToken}) async {
    await localStorage.saveAcessToken(accessToken);
    await localStorage.saveRefreshToken(refreshToken);

    emit(state.copyWith(
      status: AuthStatus.authenticated,
      accessToken: accessToken,
      refreshToken: refreshToken,
    ));
  }

  // Logout method
  Future<void> logout() async {
    await localStorage.clearAllData();

    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
      accessToken: null,
      refreshToken: null,
    ));
  }
}
