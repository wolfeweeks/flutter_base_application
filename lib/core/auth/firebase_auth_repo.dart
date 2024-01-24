import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthRepo {
  static final _firebaseAuthInstance = FirebaseAuth.instance;

  static final googleProvider = GoogleProvider(clientId: clientId);

  static final appleProvider = AppleProvider();

  // Before starting with Phone Authentication, ensure you have followed these
  // steps:
  // 1. Enable Phone as a Sign-In method in the Firebase console.
  // 2. Android: If you haven't already set your app's SHA-1 hash in the
  //    Firebase console, do so. See Authenticating Your Client for information
  //    about finding your app's SHA-1 hash.
  // 3. iOS: In Xcode, enable push notifications for your project & ensure your
  //    APNs authentication key is configured with Firebase Cloud Messaging
  //    (FCM). Additionally, you must enable background modes for remote
  //    notifications. To view an in-depth explanation of this step, view the
  //    Firebase iOS Phone Auth documentation.
  // 4. Web: Ensure that you have added your applications domain on the Firebase
  //    console, under OAuth redirect domains.
  //
  // Note: Phone number sign-in is only available for use on real devices and
  // the web. To test your authentication flow on device emulators, please see
  // https://firebase.google.com/docs/auth/flutter/phone-auth#testing
  static final phoneProvider = PhoneAuthProvider();

  //TODO: Add your client IDs here from the google cloud web console
  static String get clientId {
    if (kIsWeb) {
      return '457742369033-bu1qsq76o3pjiju81i618mj6qn6cqb50.apps.googleusercontent.com';
    } else if (Platform.isAndroid) {
      return '457742369033-m3kid6f5aiakhft4tc6i2868am8agbqq.apps.googleusercontent.com';
    } else if (Platform.isIOS) {
      return '457742369033-qookd8sss09j796hlvng4r1180am2j05.apps.googleusercontent.com';
    } else if (Platform.isMacOS) {
      return '457742369033-kcmg2v2eab32ef8qnmt8tgpdhoh5rahl.apps.googleusercontent.com';
    } else {
      throw UnsupportedError(
          'This platform is not supported for Google Sign In');
    }
  }
}
