import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  TextStyle? copyWithOpacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
}
