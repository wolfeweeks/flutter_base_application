import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/home/ui/screens/home_screen.dart';
import '../auth/data/repository/firebase_auth_repo.dart';
import '../auth/ui/screens/sign_in_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  String getInitialRoute() {
    final user = FirebaseAuthRepo.instance.currentUser;

    return switch (user) {
      null => '/sign_in',
      // User(emailVerified: false, email: final String _) => '/verify-email',
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
