extension StringBlank on String {
  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => !isBlank;

  String? get takeIfNotBlank => isNotBlank ? trim() : null;
}

extension StringFormat on String {
  String? takeTrimIfMinLength(int minLength) => trim().takeIfMinLength(minLength);

  String? takeIfMinLength(int minLength) => length >= minLength ? this : null;

  String get phoneDigits => digitsOnly;

  String get signedDigitsOnly => replaceAll(RegExp('[^0-9-]'), '');

  String get digitsOnly => replaceAll(RegExp('[^0-9]'), '');

  String get doubleOnly => replaceAll(RegExp('[^0-9.,-]'), '');

  String get firstUpperFormat => '${substring(0, 1).toUpperCase()}${substring(1)}';

  int get startWhitespace {
    int i = 0;
    while (i < length && isWhitespace(codeUnitAt(i))) {
      i++;
    }
    return i;
  }

  int get endWhitespace {
    int i = length - 1;
    while (i > 0 && isWhitespace(codeUnitAt(i))) {
      i--;
    }
    return length - i - 1;
  }

  int get countWhitespaces {
    return codeUnits.where(isWhitespace).length;
  }

  bool isWhitespace(int rune) =>
      (rune >= 0x0009 && rune <= 0x000D) ||
          rune == 0x0020 ||
          rune == 0x0085 ||
          rune == 0x00A0 ||
          rune == 0x1680 ||
          rune == 0x180E ||
          (rune >= 0x2000 && rune <= 0x200A) ||
          rune == 0x2028 ||
          rune == 0x2029 ||
          rune == 0x202F ||
          rune == 0x205F ||
          rune == 0x3000 ||
          rune == 0xFEFF;
}
