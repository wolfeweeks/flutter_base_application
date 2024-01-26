import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthRepo {
  static final instance = FirebaseAuth.instance;

  static final googleProvider = GoogleProvider(clientId: clientId);
  static final appleProvider = AppleProvider();
  static final phoneProvider = PhoneAuthProvider();
  static final emailProvider = EmailAuthProvider();

  //TODO: Add your client IDs here from the Google Cloud Web Console
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

  static Future<void> signOut() async {
    await instance.signOut();
  }
}
