import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dtos/signup_response_dto.dart';
import '../data/dtos/signup_request_dto.dart';
import '../infrastructure/providers/auth_providers.dart';
import '../domain/entities/user.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});


class AuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    // state initial value
    return null;
  }

  Future<void> signIn(String username, String password) async {
    state = const AsyncLoading();

    try {
      final api = ref.read(authApiProvider);
      final storage = ref.read(sessionStorageProvider);

      final response = await api.signIn(username: username, password: password);

      await storage.saveToken(response.token, "");

      state = AsyncData(response.toDomain());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> signOut() async {
    final storage = ref.read(sessionStorageProvider);
    await storage.clearSession();
    state = const AsyncData(null);
  }

  Future<void> signUp(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final api = ref.read(authApiProvider);
      final response = await api.signUp(SignUpRequestDto(
        username: username,
        password: password,
      ));

      state = AsyncValue.data(response.toDomain());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }


}

