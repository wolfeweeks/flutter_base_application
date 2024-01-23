// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQmK3OLuxuAC0IXWYZ2lHnUteK3G7z0Pg',
    appId: '1:457742369033:web:aef80dc3673afa793913d8',
    messagingSenderId: '457742369033',
    projectId: 'mason-testing-a4d8a',
    authDomain: 'mason-testing-a4d8a.firebaseapp.com',
    storageBucket: 'mason-testing-a4d8a.appspot.com',
    measurementId: 'G-FBYVJQT75H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxYPOmlOwelTE36ixnn1xNCC_jgPh9Uag',
    appId: '1:457742369033:android:8d02d60dd4082e873913d8',
    messagingSenderId: '457742369033',
    projectId: 'mason-testing-a4d8a',
    storageBucket: 'mason-testing-a4d8a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIi12u5Fj2w-1jCgxcy_O4_yduyxcBwJE',
    appId: '1:457742369033:ios:c682e83171e15d193913d8',
    messagingSenderId: '457742369033',
    projectId: 'mason-testing-a4d8a',
    storageBucket: 'mason-testing-a4d8a.appspot.com',
    androidClientId: '457742369033-m3kid6f5aiakhft4tc6i2868am8agbqq.apps.googleusercontent.com',
    iosClientId: '457742369033-qookd8sss09j796hlvng4r1180am2j05.apps.googleusercontent.com',
    iosBundleId: 'com.wolfeweeks.baseapplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIi12u5Fj2w-1jCgxcy_O4_yduyxcBwJE',
    appId: '1:457742369033:ios:e6928fe29f15ff3b3913d8',
    messagingSenderId: '457742369033',
    projectId: 'mason-testing-a4d8a',
    storageBucket: 'mason-testing-a4d8a.appspot.com',
    androidClientId: '457742369033-m3kid6f5aiakhft4tc6i2868am8agbqq.apps.googleusercontent.com',
    iosClientId: '457742369033-kcmg2v2eab32ef8qnmt8tgpdhoh5rahl.apps.googleusercontent.com',
    iosBundleId: 'com.wolfeweeks.baseapplication.RunnerTests',
  );
}
