import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/session/session_storage.dart';
import '../../auth/infrastructure/providers/auth_providers.dart';
import '../data/medical_history_repository.dart';

final medicalHistoryRepositoryProvider = Provider<MedicalHistoryRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return MedicalHistoryRepository(storage);
});
