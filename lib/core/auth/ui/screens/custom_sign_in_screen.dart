import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui/screens/base_page.dart';
import '../../data/repository/firebase_auth_repo.dart';

// class CustomSignInScreen extends ConsumerWidget {
//   const CustomSignInScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AuthStateListener<OAuthController>(
//       child: BasePage(
//         body: Column(
//           children: [
//             OAuthProviderButton(
//               auth: FirebaseAuthRepo.instance,
//               provider: FirebaseAuthRepo.googleProvider,
//               variant: OAuthButtonVariant.icon_and_text,
//             ),
//             OAuthProviderButton(
//               auth: FirebaseAuthRepo.instance,
//               provider: FirebaseAuthRepo.appleProvider,
//               variant: OAuthButtonVariant.icon_and_text,
//             ),
//             PhoneInput(
//               initialCountryCode: 'US',
//               onSubmit: (_) {},
//             ),
//           ],
//         ),
//       ),
//       listener: (oldState, newState, ctrl) {
//         if (newState is SignedIn) {
//           context.go('/');
//         }
//         return null;
//       },
//     );
//   }
// }

class CustomSignInScreen extends StatelessWidget {
  CustomSignInScreen({super.key});

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
    // final flowSate

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
              return CircularProgressIndicator();
            } else if (state is AuthFailed) {
              return ErrorText(exception: state.exception);
            } else {
              return Text('Unknown state $state');
            }
          },
        ),
      ),
    );
  }
}
