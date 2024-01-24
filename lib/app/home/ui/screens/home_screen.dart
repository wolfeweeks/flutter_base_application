import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/auth/data/repository/firebase_auth_repo.dart';
import '../../../../core/ui/screens/base_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      body: Center(
        child: Column(
          children: [
            const Text('Hello World'),
            ElevatedButton(
              onPressed: () async {
                FirebaseUIAuth.signOut(
                  context: context,
                  auth: FirebaseAuthRepo.instance,
                );
                // await FirebaseAuthRepo.instance.signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
