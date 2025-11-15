import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_medicalhistory_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_medication_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_mentalhealth_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_overview_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_profile_screen.dart';
import 'package:vitalia_flutter/src/features/resident/presentation/resident_reports_screen.dart';

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
      final isAuthPage =
          state.matchedLocation == '/login' ||
              state.matchedLocation == '/signup';

      if (user == null && !isAuthPage) return '/login';
      if (user != null && isAuthPage) return '/home';

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
      GoRoute(path: '/resident/reports', builder: (_, __) => const ResidentReportsScreen()),
    ],
  );
});
