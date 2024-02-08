import 'package:base_application/core/ui/widgets/layout_visualizer.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomVerificationCodeInput extends HookConsumerWidget {
  final PhoneAuthController phoneAuthController;
  final SMSCodeSent authState;

  const CustomVerificationCodeInput({
    required this.phoneAuthController,
    required this.authState,
    super.key,
  });

  final double horizontalPadding = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeInputController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final codeState = useState<String>("");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            'Enter the code sent to your phone',
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    6,
                    (index) => _buildCodeNumberBox(
                      index: index,
                      controller: codeInputController,
                      context: context,
                    ),
                  ),
                ),
              ),
            ),

            //* Hidden text field to capture input
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: TextField(
                onChanged: (value) {
                  codeState.value = value;
                },
                onSubmitted: (value) {
                  phoneAuthController.verifySMSCode(
                    value,
                    verificationId: authState.verificationId,
                    confirmationResult: authState.confirmationResult,
                  );
                },
                controller: codeInputController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                showCursor: false,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "", // Hide the length counter
                ),
                style: const TextStyle(
                  color: Colors.transparent,
                  height: 0,
                  fontSize: 0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            phoneAuthController.verifySMSCode(
              codeState.value,
              verificationId: authState.verificationId,
              confirmationResult: authState.confirmationResult,
            );
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildCodeNumberBox({
    required int index,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    final themeData = Theme.of(context);

    return Container(
      width: 40,
      height: 50,
      decoration: BoxDecoration(
        color: themeData.colorScheme.background,
        border: Border.all(
          color: themeData.colorScheme.primary,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          controller.text.length > index
              ? controller.text[index]
              : (index == controller.text.length ? "_" : ""),
          style: themeData.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
