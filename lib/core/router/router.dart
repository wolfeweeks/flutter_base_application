import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/home/ui/screens/home_screen.dart';
import '../auth/data/repository/firebase_auth_repo.dart';
import '../auth/ui/screens/custom_sign_in_screen.dart';
import '../auth/ui/screens/default_email_verification_screen.dart';
import '../auth/ui/screens/default_phone_verification_screen.dart';
import '../auth/ui/screens/default_sign_in_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  String getInitialRoute() {
    final user = FirebaseAuthRepo.instance.currentUser;

    return switch (user) {
      null => '/custom_sign_in',
      _ => '/',
    };
  }

  return GoRouter(
    initialLocation: getInitialRoute(),
    routes: [
      GoRoute(
        path: '/sign_in',
        pageBuilder: (context, state) => const MaterialPage(
          child: DefaultSignInScreen(),
        ),
        routes: [
          GoRoute(
            path: 'phone_verification',
            pageBuilder: (context, state) => const MaterialPage(
              child: DefaultPhoneVerificationScreen(),
            ),
          ),
          GoRoute(
            path: 'email_verification',
            pageBuilder: (context, state) => const MaterialPage(
              child: DefaultEmailVerificationScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/custom_sign_in',
        pageBuilder: (context, state) => const MaterialPage(
          child: CustomSignInScreen(),
        ),
      ),
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
