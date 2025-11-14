import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/auth_api.dart';
import '../../../../core/session/in_memory_session_storage.dart';
import '../../../../core/session/session_storage.dart';

// api provider
final authApiProvider = Provider<AuthApi>((ref) => AuthApi());

// storage provider
final sessionStorageProvider = Provider<SessionStorage>((ref) {
  return InMemorySessionStorage();
});
