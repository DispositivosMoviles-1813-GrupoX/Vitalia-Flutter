import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

      if (user == null && !isAuthPage) return '/login';
      if (user != null && isAuthPage) {
        if (user.role == 'ROLE_FAMILY_MEMBER' && user.residentId == null) {
          return '/create-family-member';
        }
        return '/home';
      }
      
      if (user != null && state.matchedLocation == '/create-family-member') {
         if (user.residentId != null || user.role != 'ROLE_FAMILY_MEMBER') {
           return '/home';
         }
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
      GoRoute(path: '/resident/reports', builder: (_, __) => const ResidentReportsScreen()),
      GoRoute(path: '/create-family-member', builder: (_, __) => const CreateFamilyMemberScreen()),
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