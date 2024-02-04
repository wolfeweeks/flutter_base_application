import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui/theming/example_extension.dart';
import '../../data/repository/firebase_auth_repo.dart';

class DefaultSignInScreen extends ConsumerWidget {
  const DefaultSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInScreen(
      styles: const {
        EmailFormStyle(
            // signInButtonVariant: ButtonVariant.filled,
            ),
      },
      auth: FirebaseAuthRepo.instance,
      actions: [
        AuthStateChangeAction((context, state) {
          final user = switch (state) {
            SignedIn(user: final user) => user,
            CredentialLinked(user: final user) => user,
            UserCreated(credential: final cred) => cred.user,
            _ => null,
          };

          // TODO: Set up custom navigation based on user state

          // If any user is good enough, then just go to the home page, and
          // comment out the switch statement below.
          // if (user != null) {
          //   context.go('/');
          // }

          switch (user) {
            case User(emailVerified: false, email: final String _):
              context.go('/sign_in/email_verification');
              break;
            case User():
              context.go('/');
              break;
          }
        }),
        VerifyPhoneAction(
          (context, _) {
            context.go('/sign_in/phone_verification');
          },
        ),
      ],
    );
  }
}
