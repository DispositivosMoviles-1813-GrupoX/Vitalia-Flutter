import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'in_memory_session_storage.dart';
import 'session_storage.dart';

final sessionStorageProvider = Provider<SessionStorage>((ref) {
  return InMemorySessionStorage();
});
