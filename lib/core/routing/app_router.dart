import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';

/// Refresh helper so GoRouter reacts to auth changes
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  /// Watch auth state (User? or null)
  final authState = ref.watch(authStateProvider);

  /// Stream used to trigger router refresh
  final authStream = ref.watch(authStateProvider.stream);

  return GoRouter(
    initialLocation: '/login',

    /// Rebuild router when auth state changes
    refreshListenable: GoRouterRefreshStream(authStream),

    redirect: (context, state) {
      final auth = authState;

      if (auth.isLoading) return null;

      final user = auth.asData?.value;
      final isLoggedIn = user != null;

      final loggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn) {
        return loggingIn ? null : '/login';
      }

      if (isLoggedIn && loggingIn) {
        return '/home';
      }

      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
  );
});
