import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui/screens/base_page.dart';
import '../../data/repository/firebase_auth_repo.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      body: Column(
        children: [
          OAuthProviderButton(
            auth: FirebaseAuthRepo.instance,
            provider: FirebaseAuthRepo.googleProvider,
            variant: OAuthButtonVariant.icon_and_text,
          ),
          OAuthProviderButton(
            auth: FirebaseAuthRepo.instance,
            provider: FirebaseAuthRepo.appleProvider,
            variant: OAuthButtonVariant.icon_and_text,
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/sign_in/phone_verification');
            },
            child: const Text('Phone Verification'),
          )
        ],
      ),
    );
  }
}
