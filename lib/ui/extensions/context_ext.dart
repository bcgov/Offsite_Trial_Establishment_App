import 'package:flutter/material.dart';

extension ThemeOfContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get screenWidth => MediaQuery.of(this).size.width;
}
