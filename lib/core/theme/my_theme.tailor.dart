// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'my_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MyThemeTailorMixin on ThemeExtension<MyTheme> {
  Color get background;

  @override
  MyTheme copyWith({
    Color? background,
  }) {
    return MyTheme(
      background: background ?? this.background,
    );
  }

  @override
  MyTheme lerp(covariant ThemeExtension<MyTheme>? other, double t) {
    if (other is! MyTheme) return this as MyTheme;
    return MyTheme(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyTheme &&
            const DeepCollectionEquality()
                .equals(background, other.background));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
    );
  }
}

extension MyThemeBuildContextProps on BuildContext {
  MyTheme get myTheme => Theme.of(this).extension<MyTheme>()!;
  Color get background => myTheme.background;
}
