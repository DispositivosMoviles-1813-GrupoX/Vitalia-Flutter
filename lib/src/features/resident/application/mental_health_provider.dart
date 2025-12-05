import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/session/session_storage.dart';
import '../../auth/infrastructure/providers/auth_providers.dart';
import '../data/mental_health_repository.dart';

final mentalHealthRepositoryProvider = Provider<MentalHealthRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return MentalHealthRepository(storage);
});
