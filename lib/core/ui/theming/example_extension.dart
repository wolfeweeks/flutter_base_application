// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'example_extension.tailor.dart';

// TODO: you can put whatever properties you want in this extension as "part" of
//       the theme
@TailorMixin()
class ExampleExtension extends ThemeExtension<ExampleExtension>
    with _$ExampleExtensionTailorMixin {
  const ExampleExtension({
    required this.inputDecorationTheme,
  });

  final InputDecorationTheme inputDecorationTheme;
}

// TODO: implement version(s) of the theme
const exampleExtensionImplementation = ExampleExtension(
  inputDecorationTheme: InputDecorationTheme(),
);
