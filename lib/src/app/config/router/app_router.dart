import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitalia_flutter/src/features/notifications/views/NotificationsPage.dart';
import 'package:vitalia_flutter/src/features/appointment/presentation/create_appointment_screen.dart';
import 'package:vitalia_flutter/src/features/doctor/domain/doctor.dart';
import 'package:vitalia_flutter/src/features/doctor/presentation/doctor_detail_screen.dart';
import 'package:vitalia_flutter/src/features/doctor/presentation/doctor_list_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_appointments_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/edit_resident_profile_screen.dart';
import 'package:vitalia_flutter/src/features/resident/domain/resident.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_medicalhistory_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_medication_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_mentalhealth_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_overview_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_profile_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_reports_screen.dart';
import '../../../features/family/presentation/create_family_member_screen.dart';

import '../../../features/auth/application/auth_notifier.dart';
import '../../../features/auth/presentation/login_screen.dart';
import '../../../features/auth/presentation/signup_screen.dart';
import '../../../features/auth/presentation/home_screen.dart';
import 'go_router_notifier.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authNotifierProvider);
  final notifier = ref.watch(goRouterNotifierProvider.notifier);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) {
      final user = auth.whenOrNull(data: (user) => user);
      print("AppRouter: User state: $user");
      print("AppRouter: Location: ${state.matchedLocation}");
      final isAuthPage =
          state.matchedLocation == '/login' ||
              state.matchedLocation == '/signup';

      final isCompletingProfile = state.matchedLocation == '/create-family-member';

      // 1. Si no hay usuario, mandar al Login (a menos que ya esté ahí)
      if (user == null) {
        return isAuthPage ? null : '/login';
      }

      // 2. REGLA DE ORO: Verificar si falta completar el perfil
      // Ajustamos el rol a 'FAMILY' como sale en tu log
      final isFamily = user.role == 'FAMILY' || user.role == 'ROLE_FAMILY_MEMBER';
      final missingResident = user.residentId == null;

      if (isFamily && missingResident) {
        // Si le falta residente, OBLIGARLO a ir a /create-family-member
        // Si ya está ahí, null (dejarlo estar). Si no, redirigir.
        return isCompletingProfile ? null : '/create-family-member';
      }

      // 3. Si ya tiene todo completo e intenta volver al Login o al Registro de familiar...
      if (isAuthPage || (isCompletingProfile && !missingResident)) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/signup', builder: (_, __) => const SignUpScreen()),
      GoRoute(path: '/home',  builder: (_, __) => const HomeScreen()),
      GoRoute(path: '/', redirect: (_, __) => '/home'),
      GoRoute(path: '/resident', builder: (_, __) => const ResidentOverviewScreen()),
      GoRoute(path: '/resident/medical-history', builder: (_, __) => const ResidentMedicalHistoryScreen()),
      GoRoute(path: '/resident/medication', builder: (_, __) => const ResidentMedicationsScreen()),
      GoRoute(path: '/resident/mental-health', builder: (_, __) => const ResidentMentalHealthScreen()),
      GoRoute(path: '/resident/profile', builder: (_, __) => const ResidentProfileScreen()),
      GoRoute(
        path: '/resident/profile/edit',
        builder: (context, state) {
          final resident = state.extra as Resident;
          return EditResidentProfileScreen(resident: resident);
        },
      ),
      GoRoute(path: '/resident/reports', builder: (_, __) => const ResidentReportsScreen()),
      GoRoute(path: '/create-family-member', builder: (_, __) => const CreateFamilyMemberScreen()),
      GoRoute(path: '/notifications', builder: (_, __) => const NotificationsPage())
      GoRoute(path: '/appointments/create', builder: (_, __) => const CreateAppointmentScreen()),
      GoRoute(path: '/doctor-list', builder: (_, __) => const DoctorListScreen()),
      GoRoute(path: '/doctor-detail', builder: (_, state) => DoctorDetailScreen(doctor: state.extra as Doctor)),
      GoRoute(path: '/appointment-list', builder: (_, __)=> const ResidentAppointmentsScreen())
    ],
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}