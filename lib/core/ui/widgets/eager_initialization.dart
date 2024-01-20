import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EagerInitialization extends ConsumerWidget {
  final Widget child;

  const EagerInitialization({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}
