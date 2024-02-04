// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'example_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ExampleExtensionTailorMixin on ThemeExtension<ExampleExtension> {
  InputDecorationTheme get inputDecorationTheme;

  @override
  ExampleExtension copyWith({
    InputDecorationTheme? inputDecorationTheme,
  }) {
    return ExampleExtension(
      inputDecorationTheme: inputDecorationTheme ?? this.inputDecorationTheme,
    );
  }

  @override
  ExampleExtension lerp(
      covariant ThemeExtension<ExampleExtension>? other, double t) {
    if (other is! ExampleExtension) return this as ExampleExtension;
    return ExampleExtension(
      inputDecorationTheme:
          t < 0.5 ? inputDecorationTheme : other.inputDecorationTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExampleExtension &&
            const DeepCollectionEquality()
                .equals(inputDecorationTheme, other.inputDecorationTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(inputDecorationTheme),
    );
  }
}

extension ExampleExtensionBuildContextProps on BuildContext {
  ExampleExtension get exampleExtension =>
      Theme.of(this).extension<ExampleExtension>()!;
  InputDecorationTheme get inputDecorationTheme =>
      exampleExtension.inputDecorationTheme;
}
