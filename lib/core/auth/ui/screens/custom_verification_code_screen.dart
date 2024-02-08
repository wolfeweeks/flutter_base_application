import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/screens/base_page.dart';
import '../widgets/custom_verification_code_input.dart';

class CustomVerificationCodeScreen extends StatelessWidget {
  final Object flowKey;

  CustomVerificationCodeScreen({required this.flowKey, super.key});

  // final phoneInputKey = GlobalKey<PhoneInputState>();
  final action = AuthAction.signIn;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: FirebaseUIActions(
        actions: const [],
        child: AuthFlowBuilder<PhoneAuthController>(
          flowKey: flowKey,
          action: action,
          listener: (oldState, newState, controller) {
            if (newState is SignedIn) {
              context.go('/');
            }
          },
          builder: (context, state, ctrl, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //* SMS code input
                if (state is SMSCodeSent) ...[
                  CustomVerificationCodeInput(
                    phoneAuthController: ctrl,
                    authState: state,
                  )
                ],

                //* Loading
                if (state is SigningIn) ...[
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],

                if (state is AuthFailed) ...[
                  Column(
                    children: [
                      ErrorText(exception: state.exception),
                      const SizedBox(height: 8),
                      TextButton(
                        child: const Text('Try Again'),
                        onPressed: () {
                          ctrl.reset();
                          context.go('/sign_in/phone_verification');
                        },
                      ),
                    ],
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
