import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../appointment/application/appointment_provider.dart';
import '../../doctor/application/doctor_provider.dart';
import '../../resident/application/resident_provider.dart';

class HomeInfo {
  final String doctorName;
  final String doctorStatus;
  final String nextAppointmentDate;
  final String nextAppointmentType;
  final String lastUpdate;
  final bool hasData;

  HomeInfo({
    required this.doctorName,
    required this.doctorStatus,
    required this.nextAppointmentDate,
    required this.nextAppointmentType,
    required this.lastUpdate,
    this.hasData = true,
  });
}





final homeInfoFutureProvider = FutureProvider<HomeInfo>((ref) async {
  final resident = await ref.watch(residentProvider.future);
  final appointments = await ref.watch(appointmentsByResidentProvider(resident.id).future);
  final doctors = await ref.watch(doctorsListProvider.future);

  // Find the next appointment (closest future date)
  final now = DateTime.now();
  final upcomingAppointments = appointments
      .where((a) => a.date.isAfter(now) || isSameDay(a.date, now))
      .toList();
  
  upcomingAppointments.sort((a, b) => a.date.compareTo(b.date));

  if (upcomingAppointments.isEmpty) {
    return HomeInfo(
      doctorName: "No asignado",
      doctorStatus: "-",
      nextAppointmentDate: "Sin citas próximas",
      nextAppointmentType: "-",
      lastUpdate: DateFormat('HH:mm a').format(DateTime.now()),
      hasData: false,
    );
  }

  final nextAppointment = upcomingAppointments.first;
  
  // Find the doctor for this appointment
  final doctor = doctors.firstWhere(
    (d) => d.id == nextAppointment.doctorId,
    orElse: () => throw Exception("Doctor not found"),
  );

  return HomeInfo(
    doctorName: "${doctor.firstName} ${doctor.lastName}",
    doctorStatus: doctor.specialty, // Using specialty as status for now
    nextAppointmentDate: DateFormat('dd MMM, HH:mm a').format(
      DateTime(
        nextAppointment.date.year,
        nextAppointment.date.month,
        nextAppointment.date.day,
        nextAppointment.time.hour,
        nextAppointment.time.minute,
      ),
    ),
    nextAppointmentType: "Consulta", // Placeholder
    lastUpdate: "Actualizado: ${DateFormat('HH:mm a').format(DateTime.now())}",
  );
});

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
