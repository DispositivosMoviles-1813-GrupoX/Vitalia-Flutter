import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/appointment_repository.dart';
import '../domain/appointment.dart';

final appointmentsListProvider = FutureProvider<List<Appointment>>((ref) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  return repository.getAppointments();
});

final appointmentsByResidentProvider = FutureProvider.family<List<Appointment>, int>((ref, residentId) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  return repository.getAppointmentsByResidentId(residentId);
});

final appointmentByIdProvider = FutureProvider.family<Appointment?, int>((ref, id) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  return repository.getAppointmentById(id);
});
