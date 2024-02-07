import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/screens/base_page.dart';

class CustomPhoneVerificationScreen extends StatelessWidget {
  CustomPhoneVerificationScreen({super.key});

  final phoneInputKey = GlobalKey<PhoneInputState>();
  final flowKey = Object();
  final action = AuthAction.signIn;

  PhoneNumberSubmitCallback onSubmit(PhoneAuthController ctrl) =>
      (String phoneNumber) {
        ctrl.acceptPhoneNumber(
          phoneNumber,
        );
      };

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

            if (newState is SMSCodeRequested) {
              // final onSMSCodeRequested =
              //     FirebaseUIAction.ofType<SMSCodeRequestedAction>(context)
              //         ?.callback;

              // onSMSCodeRequested?.call(
              //   context,
              //   action,
              //   flowKey,
              //   PhoneInput.getPhoneNumber(phoneInputKey)!,
              // );
            }
          },
          builder: (context, state, ctrl, child) {
            if (state is AwaitingPhoneNumber || state is SMSCodeRequested) {
              return Column(
                children: [
                  PhoneInput(
                    initialCountryCode: 'US',
                    onSubmit: onSubmit(ctrl),
                    key: phoneInputKey,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      onSubmit(ctrl)(PhoneInput.getPhoneNumber(phoneInputKey)!);
                    },
                  ),
                ],
              );
            } else if (state is SMSCodeSent) {
              return SMSCodeInput(
                onSubmit: (smsCode) {
                  ctrl.verifySMSCode(
                    smsCode,
                    verificationId: state.verificationId,
                    confirmationResult: state.confirmationResult,
                  );
                },
              );
            } else if (state is SigningIn) {
              return const CircularProgressIndicator();
            } else if (state is AuthFailed) {
              return Column(
                children: [
                  // ErrorText(exception: state.exception),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('Go Back'),
                    onPressed: () {
                      // context.goBack();
                    },
                  ),
                ],
              );
            } else {
              return Text('Unknown state $state');
            }
          },
        ),
      ),
    );
  }
}
