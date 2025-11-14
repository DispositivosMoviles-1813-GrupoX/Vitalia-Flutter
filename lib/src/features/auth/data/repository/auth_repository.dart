import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/session/session_providers.dart';
import '../../../../core/session/session_storage.dart';
import '../../data/auth_api.dart';
import '../../domain/entities/user.dart';
import '../dtos/auth_response_dto.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.read(authApiProvider);
  final session = ref.read(sessionStorageProvider);
  return AuthRepository(api: api, sessionStorage: session);
});

class AuthRepository {
  final AuthApi api;
  final SessionStorage sessionStorage;

  AuthRepository({
    required this.api,
    required this.sessionStorage,
  });

  Future<AuthResponseDto> signIn(String username, String password) async {
    //call to api
    final AuthResponseDto = await api.signIn(username: username, password: password);

    //save token
    await sessionStorage.saveToken(AuthResponseDto.token, "");

    // return dto
    return AuthResponseDto;
  }

  Future<void> signOut() async {
    await sessionStorage.clearSession();
  }
}
