import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/firebase_auth_repo.dart';

class DefaultEmailVerificationScreen extends ConsumerWidget {
  const DefaultEmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EmailVerificationScreen(
      actions: [
        EmailVerifiedAction(() {
          context.go('/');
        }),
        AuthCancelledAction((context) {
          FirebaseUIAuth.signOut(
            context: context,
            auth: FirebaseAuthRepo.instance,
          );
          context.go('/sign_in');
        }),
      ],
    );
  }
}
