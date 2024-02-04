import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/ui/widgets/auth_gate.dart';

class CupertinoBasePage extends ConsumerWidget {
  final Widget body;
  final double verticalPadding = 8;
  final double horizontalPadding = 16;
  final Color? backgroundColor;

  const CupertinoBasePage({
    required this.body,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      child: AuthGate(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
