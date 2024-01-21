import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasePage extends ConsumerWidget {
  final Widget body;

  const BasePage({required this.body, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: body,
    );
  }
}
