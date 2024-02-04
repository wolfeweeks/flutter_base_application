// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'phone_auth_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$PhoneAuthExtensionTailorMixin on ThemeExtension<PhoneAuthExtension> {
  @override
  PhoneAuthExtension copyWith() {
    return PhoneAuthExtension();
  }

  @override
  PhoneAuthExtension lerp(
      covariant ThemeExtension<PhoneAuthExtension>? other, double t) {
    if (other is! PhoneAuthExtension) return this as PhoneAuthExtension;
    return PhoneAuthExtension();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PhoneAuthExtension);
  }

  @override
  int get hashCode {
    return runtimeType.hashCode;
  }
}

extension PhoneAuthExtensionBuildContextProps on BuildContext {
  PhoneAuthExtension get phoneAuthExtension =>
      Theme.of(this).extension<PhoneAuthExtension>()!;
}
