enum ButtonType { primary, outline, text }

enum ButtonWidthType { maximum, minimum }

extension ButtonTypeSize on ButtonWidthType {
  double get minimumWidth {
    switch (this) {
      case ButtonWidthType.maximum:
        return double.infinity;
      case ButtonWidthType.minimum:
        return 0;
    }
  }
}
