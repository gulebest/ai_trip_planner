import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/get_started_page.dart';
import '../../features/auth/presentation/human_verification_page.dart';
import '../../features/auth/presentation/image_captcha_page.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/splash/splash_page.dart';

import '../../features/onboarding/presentation/onboarding_page_1.dart';
import '../../features/onboarding/presentation/onboarding_page_2.dart';
import '../../features/onboarding/presentation/onboarding_page_3.dart';

/// 🔁 Refresh router when auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _sub;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _sub = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authAsync = ref.watch(authStateProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',

    refreshListenable: GoRouterRefreshStream(
      ref.read(authStateProvider.stream),
    ),

    redirect: (context, state) {
      final user = authAsync.asData?.value;
      final loggedIn = user != null;

      final path = state.uri.path;

      final isSplash = path == '/';
      final isOnboarding = path.startsWith('/onboarding');
      final isGetStarted = path == '/get-started';
      final isHumanVerify = path == '/human-verification';
      final isImageCaptcha = path == '/image-captcha';
      final isLogin = path == '/login';

      // 1️⃣ Splash is always allowed
      if (isSplash) return null;

      // 2️⃣ NOT logged in
      if (!loggedIn) {
        // Allow onboarding + auth flow
        if (isOnboarding ||
            isGetStarted ||
            isHumanVerify ||
            isImageCaptcha ||
            isLogin) {
          return null;
        }

        // Everything else → onboarding
        return '/onboarding-1';
      }

      // 3️⃣ Logged in
      // Block onboarding & auth flow
      if (loggedIn &&
          (isOnboarding ||
              isGetStarted ||
              isHumanVerify ||
              isImageCaptcha ||
              isLogin)) {
        return '/home';
      }

      return null;
    },

    routes: [
      /// Splash
      GoRoute(path: '/', builder: (_, __) => const SplashPage()),

      /// Onboarding
      GoRoute(
        path: '/onboarding-1',
        builder: (_, __) => const OnboardingPage1(),
      ),
      GoRoute(
        path: '/onboarding-2',
        builder: (_, __) => const OnboardingPage2(),
      ),
      GoRoute(
        path: '/onboarding-3',
        builder: (_, __) => const OnboardingPage3(),
      ),

      /// Get Started
      GoRoute(path: '/get-started', builder: (_, __) => const GetStartedPage()),

      /// Verification flow (ONLY TWO)
      GoRoute(
        path: '/human-verification',
        builder: (_, __) => const HumanVerificationPage(),
      ),
      GoRoute(
        path: '/image-captcha',
        builder: (_, __) => const ImageCaptchaPage(),
      ),

      /// Login
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),

      /// Home
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    ],
  );
});
