import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './firebase_options.dart';
import './core/database/sqlite_db.dart';
import './core/router/router.dart';
import 'core/auth/data/repository/firebase_auth_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqlite database instance
  await SQLiteDB.database;

  // Set status bar color behavior
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
      statusBarIconBrightness:
          Brightness.dark, // Set brightness of icons to dark
      statusBarBrightness:
          Brightness.light, // Set brightness of status bar to light
    ),
  );

  await Firebase.initializeApp(
    // TODO: Use the FlutterFire CLI to generate firebase_options.dart, and
    //       import the file, and uncomment the following line
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    FirebaseAuthRepo.googleProvider,
    FirebaseAuthRepo.appleProvider,
    FirebaseAuthRepo.phoneProvider,
  ]);

  runApp(const ProviderScope(child: MyAppName()));
}

class MyAppName extends ConsumerWidget {
  const MyAppName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: use the build runner to generate the project's providers
    final router = ref.watch(routerProvider);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
