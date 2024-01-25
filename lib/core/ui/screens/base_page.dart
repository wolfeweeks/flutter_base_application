import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/ui/widgets/auth_gate.dart';

class BasePage extends ConsumerWidget {
  final Widget body;

  const BasePage({required this.body, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AuthGate(
        child: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
