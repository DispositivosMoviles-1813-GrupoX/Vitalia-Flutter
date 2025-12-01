import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/application/auth_notifier.dart';
import '../domain/resident.dart';
import '../data/resident_repository.dart';

import '../../../core/session/session_storage.dart';
import '../../auth/infrastructure/providers/auth_providers.dart';

final residentRepositoryProvider = Provider<ResidentRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return ResidentRepository(storage);
});

final residentProvider = FutureProvider<Resident>((ref) async {
  final repo = ref.read(residentRepositoryProvider);

  // 1. Observamos el estado de la autenticación
  final userAsync = ref.watch(authNotifierProvider);

  // 2. Si la autenticación aún está cargando, nosotros también debemos cargar.
  // Lanzamos un error temporal o retornamos un Future que no completa todavía
  // para mantener el estado de "loading" sin ejecutar lógica errónea.
  if (userAsync.isLoading) {
    return Completer<Resident>().future;
  }

  final user = userAsync.value;

  // 3. DEBUG: Esto te dirá en la consola qué está pasando
  print("ResidentProvider: Usuario actual -> $user");

  if (user == null) {
    print("ResidentProvider: Usuario es nulo. Retornando error o esperando autenticación.");
    // No intentamos hacer fetch si no hay usuario, porque fallará con 401.
    throw Exception("Usuario no autenticado.");
  }

  if (user.residentId != null) {
    return repo.getResidentDetails(user.residentId!);
  } else {
    // Fallback: fetch all and pick first, or pick based on some other logic.
    // This is useful if the user is a family member linked to a resident but the ID isn't in the user object yet.
    final residents = await repo.getAllResidents();
    if (residents.isNotEmpty) {
      // For now, just pick the first one. 
      // In a real app, we might show a selection screen.
      return repo.getResidentDetails(residents.first.id);
    }
    throw Exception("User has no linked resident and no residents found.");
  }
});
