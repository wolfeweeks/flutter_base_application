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
    return AuthStateListener<OAuthController>(
      child: BasePage(
        backgroundColor: Colors.blue,
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
            Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  // contentPadding: const EdgeInsets.symmetric(
                  //   horizontal: 16,
                  //   vertical: 8,
                  // ),
                  filled: true,
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const PhoneInput(
                initialCountryCode: 'US',
              ),
            ),
          ],
        ),
      ),
      listener: (oldState, newState, ctrl) {
        if (newState is SignedIn) {
          context.go('/');
        }
        return null;
      },
    );
  }
}
