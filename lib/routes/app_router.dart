import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/home/home_screen.dart';
import '../providers/auth_provider.dart';

class AppRouter {
  static GoRouter createRouter(AuthProvider authProvider) {
    return GoRouter(
      initialLocation: '/onboarding',
      refreshListenable: authProvider,
      routes: [
        GoRoute(
          path: '/onboarding',
          name: 'onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          name: 'signup',
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Sayfa bulunamadı: ${state.uri}'),
        ),
      ),
      redirect: (context, state) {
        final loggedIn = authProvider.isAuthenticated;
        final location = state.uri.path;
        final isLogin = location == '/login';
        final isSignup = location == '/signup';
        final isAuthRoute = isLogin || isSignup;
        final isOnboarding = location == '/onboarding';
        final isProtected = location == '/home';

        // Get "from" query param if exists
        final from = state.uri.queryParameters['from'];

        // Rule 1: If NOT logged in and trying to access protected route => redirect to /login
        if (!loggedIn && isProtected) {
          // Preserve the original location in query params for deep linking
          final encodedFrom = Uri.encodeComponent(location);
          // Avoid redirect loop: don't redirect if already going to /login
          if (!isLogin) {
            return '/login?from=$encodedFrom';
          }
        }

        // Rule 2: If logged in and trying to access auth routes => redirect to /home
        // Or redirect to the original protected route if "from" param exists
        if (loggedIn && isAuthRoute) {
          if (from != null && from.isNotEmpty) {
            // Redirect to the original protected route
            try {
              final decodedFrom = Uri.decodeComponent(from);
              return decodedFrom;
            } catch (e) {
              // If decoding fails, just go to home
              return '/home';
            }
          }
          return '/home';
        }

        // Rule 3: If logged in and on onboarding => redirect to /home
        if (loggedIn && isOnboarding) {
          return '/home';
        }

        // No redirect needed
        return null;
      },
    );
  }
}
