import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../auth/ui/widgets/auth_gate.dart';

class BasePage extends ConsumerWidget {
  final Widget body;
  final double verticalPadding = 8;
  final double horizontalPadding = 16;
  // final Color? backgroundColor;

  const BasePage({
    required this.body,
    // this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: body,
        ),
      ),
    );
  }
}
