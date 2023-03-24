import 'dart:math';

import 'package:flutter/material.dart';

extension RectExt on Rect {
  Rect combine(Rect second) {
    return Rect.fromLTRB(
      min(left, second.left),
      min(top, second.top),
      max(right, second.right),
      max(bottom, second.bottom),
    );
  }
}
