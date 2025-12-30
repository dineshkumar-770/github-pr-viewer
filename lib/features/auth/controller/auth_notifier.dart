import 'package:flutter_riverpod/legacy.dart';
import 'package:github_pr_viewer/core/secure_storage/secure_storage_service.dart';
import 'package:github_pr_viewer/features/auth/controller/auth_states.dart';
import 'package:github_pr_viewer/utils/constants/constant_strings.dart';

class AuthNotifier extends StateNotifier<AuthStates> {
  AuthNotifier(this._storage) : super(AuthStates.initial()) {
    _checkToken();
  }

  final SecureStorageService _storage;

  Future<void> _checkToken() async {
    final token = await _storage.read(ConstantStrings.tokenKey);

    if (token != null && token.isNotEmpty) {
      state = state.copyWith( isAuthenticated: true, authToken: token);
    } else {
      state = state.copyWith( isAuthenticated: false, authToken: null);
    }
  }

  Future<void> saveToken(String token) async {
    state = state.copyWith(isLoading: true);
    await _storage.write(ConstantStrings.tokenKey, token);
    await Future.delayed(const Duration(seconds: 3));
    state = state.copyWith(isAuthenticated: true, authToken: token,isLoading: false);
  }

  Future<void> logout() async {
    await _storage.delete(ConstantStrings.tokenKey);
    state = state.copyWith(isAuthenticated: false, authToken: null);
  }
}
