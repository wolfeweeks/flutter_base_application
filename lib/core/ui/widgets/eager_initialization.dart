import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/data/providers/auth_state_changes_provider.dart';
import '../theming/theme_mode_provider.dart';

class EagerInitialization extends ConsumerWidget {
  final Widget child;

  const EagerInitialization({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: watch any providers you want to eagerly initialize in here
    ref.watch(appThemeModeProvider);
    ref.watch(authStateChangesProvider);

    return child;
  }
}
