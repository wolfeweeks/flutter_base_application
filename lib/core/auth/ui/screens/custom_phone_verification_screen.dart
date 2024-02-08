import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/screens/base_page.dart';

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
            if (newState is AuthFailed) {
              print('AuthFailed: ${newState.exception}');
            }

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
                  PhoneInput(
                    initialCountryCode: 'US',
                    onSubmit: (String phoneNumber) {
                      ctrl.acceptPhoneNumber(phoneNumber);
                    },
                    key: phoneInputKey,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      ctrl.acceptPhoneNumber(
                          PhoneInput.getPhoneNumber(phoneInputKey)!);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    child: const Text('Go Back'),
                    onPressed: () {
                      context.go('/sign_in');
                    },
                  ),
                ],

                // //* SMS code input
                // if (state is SMSCodeSent) ...[
                //   SMSCodeInput(
                //     autofocus: true,
                //     onSubmit: (smsCode) {
                //       ctrl.verifySMSCode(
                //         smsCode,
                //         verificationId: state.verificationId,
                //         confirmationResult: state.confirmationResult,
                //       );
                //     },
                //   ),
                // ],

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

            // if (state is AwaitingPhoneNumber || state is SMSCodeRequested) {
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       PhoneInput(
            //         initialCountryCode: 'US',
            //         onSubmit: onPhoneNumberSubmit(ctrl),
            //         key: phoneInputKey,
            //       ),
            //       const SizedBox(height: 16),
            //       ElevatedButton(
            //         child: const Text('Submit'),
            //         onPressed: () {
            //           onPhoneNumberSubmit(ctrl)(
            //               PhoneInput.getPhoneNumber(phoneInputKey)!);
            //         },
            //       ),
            //       // const SizedBox(height: 16),
            //       TextButton(
            //         child: const Text('Go Back'),
            //         onPressed: () {
            //           context.go('/sign_in');
            //         },
            //       ),
            //     ],
            //   );
            // } else if (state is SMSCodeSent) {
            //   return SMSCodeInput(
            //     onSubmit: (smsCode) {
            //       ctrl.verifySMSCode(
            //         smsCode,
            //         verificationId: state.verificationId,
            //         confirmationResult: state.confirmationResult,
            //       );
            //     },
            //   );
            // } else if (state is SigningIn) {
            //   return const CircularProgressIndicator();
            // } else if (state is AuthFailed) {
            //   return Column(
            //     children: [
            //       ErrorText(exception: state.exception),
            //       const SizedBox(height: 8),
            //       TextButton(
            //         child: const Text('Try Again'),
            //         onPressed: () {
            //           ctrl.reset();
            //           context.go('/sign_in/phone_verification');
            //         },
            //       ),
            //     ],
            //   );
            // } else {
            //   return Text('Unknown state $state');
            // }
          },
        ),
      ),
    );
  }
}
