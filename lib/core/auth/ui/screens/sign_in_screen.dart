import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultSignInScreen extends ConsumerWidget {
  const DefaultSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInScreen(actions: [
      AuthStateChangeAction((context, state) {
        final user = switch (state) {
          SignedIn(user: final user) => user,
          CredentialLinked(user: final user) => user,
          UserCreated(credential: final cred) => cred.user,
          _ => null,
        };

        switch (user) {
          case User(emailVerified: true):
            context.go('/');
            break;
          // case User(emailVerified: false, email: final String _):
          //   //navigate to email verification screen
          //   break;
        }
      }),
    ]);
  }
}
