import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomPhoneInput extends HookConsumerWidget {
  final PhoneAuthController phoneAuthController;

  const CustomPhoneInput({
    required this.phoneAuthController,
    super.key,
  });

  final double horizontalPadding = 40;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberState = useState<String>("1");
    final phoneNumberController =
        useTextEditingController(text: phoneNumberState.value);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Enter your phone number',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            autofocus: true,
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              prefix: Text('+'),
              counterText: '',
            ),
            onChanged: (value) {
              phoneNumberState.value = value;
            },
            onSubmitted: (value) {
              phoneAuthController.acceptPhoneNumber('+$value');
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              phoneAuthController
                  .acceptPhoneNumber('+${phoneNumberState.value}');
            },
          ),
        ],
      ),
    );
  }
}
