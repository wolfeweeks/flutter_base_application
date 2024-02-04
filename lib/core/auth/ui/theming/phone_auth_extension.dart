import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'phone_auth_extension.tailor.dart';

@tailorMixin
class PhoneAuthExtension extends ThemeExtension<PhoneAuthExtension>
    with _$PhoneAuthExtensionTailorMixin {
  const PhoneAuthExtension();
}

// TODO: implement version(s) of the theme
const phoneAuth = PhoneAuthExtension();
