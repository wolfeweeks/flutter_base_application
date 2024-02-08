import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/home/ui/screens/home_screen.dart';
import '../auth/data/providers/auth_state_changes_provider.dart';
import '../auth/data/repository/firebase_auth_repo.dart';
import '../auth/ui/screens/custom_phone_verification_screen.dart';
import '../auth/ui/screens/custom_sign_in_screen.dart';
import '../auth/ui/screens/custom_verification_code_screen.dart';
import '../auth/ui/screens/default_email_verification_screen.dart';
import '../auth/ui/screens/default_phone_verification_screen.dart';
import '../auth/ui/screens/default_sign_in_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  String getInitialRoute() {
    final user = FirebaseAuthRepo.instance.currentUser;

    return switch (user) {
      null => '/sign_in',
      _ => '/',
    };
  }

  return GoRouter(
    initialLocation: getInitialRoute(),
    redirect: (context, state) {
      // TODO: set up custom redirect logic
      final path = state.uri.path;
      print('Redirecting to $path');

      if (authStateChanges.isLoading || authStateChanges.hasError) return null;

      final isLoggedIn = authStateChanges.valueOrNull != null;

      if (isLoggedIn) return '/';

      return null;
    },
    routes: [
      // //* Default Sign In Screen
      // GoRoute(
      //   path: '/sign_in',
      //   pageBuilder: (context, state) => const MaterialPage(
      //     child: DefaultSignInScreen(),
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: 'phone_verification',
      //       pageBuilder: (context, state) => const MaterialPage(
      //         child: DefaultPhoneVerificationScreen(),
      //       ),
      //     ),
      //     GoRoute(
      //       path: 'email_verification',
      //       pageBuilder: (context, state) => const MaterialPage(
      //         child: DefaultEmailVerificationScreen(),
      //       ),
      //     ),
      //   ],
      // ),

      //* Custom Sign In Screen
      GoRoute(
        path: '/sign_in',
        pageBuilder: (context, state) => const MaterialPage(
          child: CustomSignInScreen(),
        ),
        routes: [
          GoRoute(
            path: 'phone_verification',
            pageBuilder: (context, state) => MaterialPage(
              child: CustomPhoneVerificationScreen(),
            ),
            routes: [
              GoRoute(
                path: 'verification_code',
                pageBuilder: (context, state) {
                  final flowKey = state.extra as Object;
                  return MaterialPage(
                    child: CustomVerificationCodeScreen(flowKey: flowKey),
                  );
                },
              ),
            ],
          ),
        ],
      ),

      //* Home Screen
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
        routes: [
          GoRoute(
            name: 'example',
            path: 'example/:param',
            pageBuilder: (context, state) => MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text(state.pathParameters['param']!),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
