import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// TODO: customize your themes here:
//       https://rydmike.com/flexcolorscheme/themesplayground-latest/
abstract class AppTheme {
  static ThemeData get lightTheme {
    return FlexThemeData.light(
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      useMaterial3: true,
    );
  }
}
