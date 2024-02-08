import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/screens/base_page.dart';
import '../widgets/custom_phone_input.dart';

class CustomPhoneVerificationScreen extends StatelessWidget {
  CustomPhoneVerificationScreen({super.key});

  final phoneInputKey = GlobalKey<PhoneInputState>();
  final flowKey = Object();
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
            print('oldState: $oldState, newState: $newState');

            if (newState is SignedIn) {
              context.go('/');
            }

            if (newState is SMSCodeSent) {
              context.go(
                '/sign_in/phone_verification/verification_code',
                extra: flowKey,
              );
            }
          },
          builder: (context, state, ctrl, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //* Phone input
                if (state is AwaitingPhoneNumber ||
                    state is SMSCodeRequested) ...[
                  CustomPhoneInput(phoneAuthController: ctrl),
                  TextButton(
                    child: const Text('Go Back'),
                    onPressed: () {
                      context.go('/sign_in');
                    },
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
