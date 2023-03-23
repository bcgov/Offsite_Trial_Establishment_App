import 'package:flutter/material.dart';

abstract class AppColors {
  static const zeroShadowColor = Color(0x40000000);
  static const shadowColor = Color(0x33000000);
  static const secondShadowColor = Color(0x1F000000);
  static const thirdShadowColor = Color(0x24000000);

  static const light = ColorScheme.light(
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xDE000000),
    // primary500
    primary: Color(0xFF478173),
    // primary400
    primaryContainer: Color(0xFF529484),
    // primary100
    secondary: Color(0xFFDCE5E2),
    // primary50
    secondaryContainer: Color(0xFFE9EFED),
    onPrimary: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
  );
}
