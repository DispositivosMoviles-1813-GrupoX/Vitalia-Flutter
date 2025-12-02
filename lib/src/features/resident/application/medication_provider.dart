import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/session/session_storage.dart';
import '../../auth/infrastructure/providers/auth_providers.dart';
import '../data/medication_repository.dart';

final medicationRepositoryProvider = Provider<MedicationRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return MedicationRepository(storage);
});
