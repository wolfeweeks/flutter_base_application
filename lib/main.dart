import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/database/sqlite_db.dart';

//TODO: mason
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqflite instance
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

  runApp(const ProviderScope(child: MyAppName()));
}

class MyAppName extends StatelessWidget {
  const MyAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
