import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/firebase_auth_repo.dart';

class DefaultPhoneVerificationScreen extends ConsumerWidget {
  const DefaultPhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PhoneInputScreen(
      auth: FirebaseAuthRepo.instance,
      actions: [
        SMSCodeRequestedAction((context, action, flowKey, phoneNumber) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SMSCodeInputScreen(
                flowKey: flowKey,
                auth: FirebaseAuthRepo.instance,
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) {
                    context.go('/');
                  }),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
