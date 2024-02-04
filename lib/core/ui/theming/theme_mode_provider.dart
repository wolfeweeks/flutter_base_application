import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() async {
    final sharedPref = await _read();
    final themeMode = sharedPref != null
        ? ThemeMode.values.firstWhere((e) => e.toString() == sharedPref)
        : null;

    if (themeMode == null) {
      _save(ThemeMode.system);
      return ThemeMode.system;
    }

    return themeMode;
  }

  void toggle() {
    switch (state.asData!.value) {
      case ThemeMode.light:
        state = const AsyncData(ThemeMode.dark);
        _save(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        state = const AsyncData(ThemeMode.light);
        _save(ThemeMode.light);
        break;
      default:
        state = const AsyncData(ThemeMode.light);
        _save(ThemeMode.light);
        break;
    }
  }

  void _save(ThemeMode themeMode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('themeMode', themeMode.toString());
  }

  Future<String?> _read() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final themeMode = sharedPreferences.getString('themeMode');
    return themeMode;
  }
}
