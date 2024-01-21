import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class FirebaseAuthRepo {
  static final _firebaseAuthInstance = FirebaseAuth.instance;

  static final googleProvider = GoogleProvider(
    clientId: '', //TODO: Add client ID
  );

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
}
