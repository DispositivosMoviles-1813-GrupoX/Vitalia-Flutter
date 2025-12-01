import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../family/data/family_repository.dart';
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
      final familyRepo = ref.read(familyRepositoryProvider);

      // 1. Login API
      final response = await api.signIn(username: username, password: password);
      await storage.saveToken(response.token, "");

      // 2. Usuario base (sin residentId)
      // Usamos una variable clara llamada 'userToSave'
      User userToSave = response.toDomain();

      print("🔹 Usuario base obtenido: ${userToSave.username} (ID: ${userToSave.id})");

      // 3. Buscar perfil
      try {
        final familyMember = await familyRepo.getFamilyMemberByUserId(userToSave.id);

        if (familyMember != null) {
          print("🔹 Vinculando ResidentID detectado: ${familyMember.linkedResidentId}");

          // Forzamos la actualización sobre la variable userToSave
          userToSave = userToSave.copyWith(residentId: familyMember.linkedResidentId);

        } else {
          print("🔸 No se encontró familiar vinculado.");
        }
      } catch (e) {
        print("🔸 Error buscando perfil (es normal si es usuario nuevo): $e");
      }

      // 4. Verificación FINAL antes de guardar
      print("💾 GUARDANDO ESTADO FINAL: ResidentID = ${userToSave.residentId}");

      // 5. Actualizar estado
      print("🔍 DEBUG FINAL antes de state: ${userToSave.residentId}");
      state = AsyncData(userToSave);

    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> signOut() async {
    final storage = ref.read(sessionStorageProvider);
    await storage.clearSession();
    state = const AsyncData(null);
  }

  Future<void> signUp(String username, String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final api = ref.read(authApiProvider);
      final response = await api.signUp(SignUpRequestDto(
        username: username,
        password: password,
        emailAddress: email,
      ));

      print("AuthNotifier: SignUp success. Response: $response");
      
      // Auto-login to get the token (without updating state yet)
      final storage = ref.read(sessionStorageProvider);
      final signInResponse = await api.signIn(username: username, password: password);
      await storage.saveToken(signInResponse.token, "");
      
      // Set state using the SignUp response which has the correct role
      state = AsyncValue.data(response.toDomain());
      
      print("AuthNotifier: Auto-login success and state updated with SignUp details");
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }


  void setResidentId(int residentId) {
// 1. Verificamos si tenemos un usuario cargado
    final currentUser = state.value;

    if (currentUser != null) {
      // 2. Creamos una COPIA del usuario con el nuevo ID (porque Freezed es inmutable)
      final updatedUser = currentUser.copyWith(residentId: residentId);

      // 3. Actualizamos el estado para que el Router se entere y redirija al Home
      state = AsyncData(updatedUser);
    }
  }
}

