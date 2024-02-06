import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui/screens/base_page.dart';

class CustomPhoneVerificationScreen extends ConsumerWidget {
  final Object flowKey;

  const CustomPhoneVerificationScreen({required this.flowKey, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      body: Container(),
    );
  }
}
