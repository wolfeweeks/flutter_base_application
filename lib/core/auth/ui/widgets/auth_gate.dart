import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/firebase_auth_repo.dart';

/// AuthGate is a widget that listens to the authentication state changes
/// and renders the appropriate screen based on the current authentication state.
///
/// This widget uses Firebase Authentication to determine if a user is signed in.
/// If the user is not signed in, it redirects to a sign-in screen.
/// If the user is signed in, it displays the child widget.
///
/// The authentication state is managed using a StreamBuilder that listens to
/// FirebaseAuthRepo.instance.authStateChanges() stream.
///
/// Usage:
/// ```dart
/// AuthGate(
///   child: HomeScreen(), // Your home screen widget
/// )
/// ```
class AuthGate extends ConsumerWidget {
  final Widget child;

  const AuthGate({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuthRepo.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            Future.microtask(() => context.go('/sign_in'));
          }
        }

        return child;
      },
    );
  }
}
