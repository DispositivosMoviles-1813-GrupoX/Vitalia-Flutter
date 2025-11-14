import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    ],
  );
});
