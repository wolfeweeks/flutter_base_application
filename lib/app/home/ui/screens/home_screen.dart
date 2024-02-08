import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/auth/data/repository/firebase_auth_repo.dart';
import '../../../../core/auth/ui/widgets/custom_phone_input.dart';
import '../../../../core/ui/screens/base_page.dart';
import '../../../../core/ui/theming/theme_mode_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(appThemeModeProvider);

    return BasePage(
      body: Center(
        child: Column(
          children: [
            const Text('Hello World'),

            // TODO: You can use the following setup for signing a user out.
            //       You can place this logic wherever you want in your app.
            ElevatedButton(
              onPressed: () async {
                FirebaseUIAuth.signOut(
                  context: context,
                  auth: FirebaseAuthRepo.instance,
                );
              },
              child: const Text('Sign Out'),
            ),

            // TODO: You can toggle between themes with the following switch.
            //       You can place this logic wherever you want in your app.
            Switch(
              value: appThemeMode.valueOrNull == ThemeMode.dark,
              onChanged: (_) {
                ref.read(appThemeModeProvider.notifier).toggle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
