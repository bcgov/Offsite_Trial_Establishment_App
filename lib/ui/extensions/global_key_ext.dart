import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get bounds {
    try {
      final renderObject = currentContext?.findRenderObject();
      final translation = renderObject?.getTransformTo(null).getTranslation();
      if (translation != null && renderObject?.paintBounds != null) {
        final offset = Offset(translation.x, translation.y);
        return renderObject!.paintBounds.shift(offset);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
