import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/doctor_repository.dart';
import '../domain/doctor.dart';

final doctorsListProvider = FutureProvider<List<Doctor>>((ref) async {
  final repository = ref.watch(doctorRepositoryProvider);
  return repository.getDoctors();
});

final doctorByIdProvider = FutureProvider.family<Doctor?, int>((ref, id) async {
  final repository = ref.watch(doctorRepositoryProvider);
  return repository.getDoctorById(id);
});
