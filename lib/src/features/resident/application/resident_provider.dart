import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../auth/application/auth_notifier.dart';
import '../domain/resident.dart';
//import '../infrastructure/resident_repository.dart';
import '../infrastructure/resident_repository_mock.dart';

/// Provider para la instancia del repo

final residentRepositoryProvider = Provider<ResidentRepositoryMock>((ref) {
  return ResidentRepositoryMock();
// return ResidentRepository(http.Client());
});

/// FutureProvider que obtiene el residente asociado al usuario logueado
/*final residentProvider = FutureProvider<Resident>((ref) async {
  final repo = ref.watch(residentRepositoryProvider);
  final authState = ref.watch(authNotifierProvider);

  final user = authState.value;
  if (user == null) throw Exception("No hay usuario autenticado");

  return repo.fetchResident(user.id as String);
});*/

final residentProvider = FutureProvider<Resident>((ref) async {
  final repo = ref.watch(residentRepositoryProvider);
  return repo.getResident();
});
