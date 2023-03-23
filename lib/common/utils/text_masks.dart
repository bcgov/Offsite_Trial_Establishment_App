import 'dart:math';

import 'package:flutter/services.dart';
import 'package:offsite_trial_establishment_app/common/constants/accuracy.dart';
import 'package:offsite_trial_establishment_app/common/constants/lengths.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';

class CanadaPhoneFormatter extends TextInputFormatter {
  static String? format(String? value) {
    if (value == null) {
      return null;
    }
    return CanadaPhoneFormatter()
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: value.isNotEmpty ? value : ''),
        )
        .text;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.digitsOnly;
    int selectionIndex = newValue.selection.end;
    if (text.startsWith('1')) {
      text = text.substring(1);
      selectionIndex--;
    }
    final int newTextLength = text.length;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newValue.text.isNotEmpty) {
      newText.write('1 ');
      selectionIndex += 2;
    }
    if (newTextLength >= 4) {
      newText.write('${text.substring(0, usedSubstringIndex = 3)} ');
      if (newValue.selection.end > 4) selectionIndex++;
    }
    if (newTextLength >= 7) {
      newText.write('${text.substring(3, usedSubstringIndex = 6)} ');
      if (newValue.selection.end > 7) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex) {
      newText.write(text.substring(usedSubstringIndex));
    }
    return TextEditingValue(text: newText.toString(), selection: TextSelection.collapsed(offset: selectionIndex));
  }
}

class IntegerFormatter extends TextInputFormatter {
  final bool signed;
  final String? suffix;

  IntegerFormatter({this.signed = false, this.suffix});

  static String? format(
    String? value, {
    bool signed = false,
    String? suffix,
  }) {
    if (value == null) {
      return null;
    }
    return IntegerFormatter(
      signed: signed,
      suffix: suffix,
    )
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: value),
        )
        .text;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    int selectionIndex = newValue.selection.end;
    bool hasSign = false;
    while (signed && text.startsWith('-')) {
      if (hasSign) selectionIndex--;
      text = text.substring(1);
      hasSign = true;
    }
    text = text.digitsOnly;
    while (text.startsWith(RegExp(r'0[0-9]'))) {
      text = text.substring(1);
      selectionIndex--;
    }
    final int newTextLength = text.length;
    var newText = '';
    var index = newTextLength - 3;
    while (index > 0) {
      newText = _addString(newText, text.substring(index, index + 3));
      if (newValue.selection.end > (index + (hasSign ? 1 : 0))) selectionIndex++;
      index -= 3;
    }
    if (index >= -2) {
      newText = _addString(newText, text.substring(0, index + 3));
    }
    if (newText.isNotEmpty && suffix != null) {
      newText += suffix!;
    }
    if (hasSign) {
      newText = '-$newText';
    }
    return TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: selectionIndex));
  }
}

class ElevationFormatter extends IntegerFormatter {
  ElevationFormatter() : super(signed: true, suffix: ' m');

  static String? format(String? value) {
    if (value == null) {
      return null;
    }
    return ElevationFormatter()
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: value),
        )
        .text;
  }
}

class SpacingFormatter extends DoubleFormatter {
  SpacingFormatter() : super(signed: false, accuracy: Accuracy.spacing, suffix: ' m');

  static String? format(String? value) {
    if (value == null) {
      return null;
    }
    return SpacingFormatter()
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: value),
        )
        .text;
  }
}

class DoubleFormatter extends TextInputFormatter {
  final int accuracy;
  final bool signed;
  final String? suffix;

  DoubleFormatter({
    this.accuracy = 3,
    this.signed = false,
    this.suffix,
  });

  static String? format(
    String? value, {
    int accuracy = 3,
    bool signed = false,
  }) {
    if (value == null) {
      return null;
    }
    return DoubleFormatter(accuracy: accuracy, signed: signed)
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: value),
        )
        .text;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var splits = newValue.text.split(RegExp(r'[,.]'));
    var text = splits.first;
    int selectionIndex = newValue.selection.end;
    bool hasSign = false;
    while (signed && text.startsWith('-')) {
      if (hasSign) selectionIndex--;
      text = text.substring(1);
      hasSign = true;
    }
    text = text.digitsOnly;
    while (text.startsWith(RegExp(r'0[0-9]'))) {
      text = text.substring(1);
      selectionIndex--;
    }
    if (text.length > Length.numberWithoutSpaces) {
      final postfix = text.substring(Length.numberWithoutSpaces);
      text = text.substring(0, Length.numberWithoutSpaces);
      if (splits.length > 1) {
        if (newValue.selection.end > Length.numberWithoutSpaces) selectionIndex += min(postfix.length, accuracy);
        splits[1] = '$postfix${splits[1]}';
      }
    }
    final int newTextLength = text.length;
    var newText = '';
    var index = newTextLength - 3;
    while (index > 0) {
      newText = _addString(newText, text.substring(index, index + 3));
      if (selectionIndex > (index + (hasSign ? 1 : 0))) selectionIndex++;
      index -= 3;
    }
    if (index >= -2) {
      newText = _addString(newText, text.substring(0, index + 3));
    }
    if (hasSign) {
      newText = '-$newText';
    }
    var doublePart = splits.length > 1 ? splits[1].digitsOnly : null;
    if (doublePart != null) {
      if (newText.isEmpty) {
        newText = '0';
        selectionIndex++;
      }
      newText += ".${doublePart.substring(0, min(doublePart.length, accuracy))}";
    }
    if (selectionIndex > newText.length) {
      selectionIndex = newText.length;
    }
    if (newText.isNotEmpty && suffix != null) {
      newText += suffix!;
    }
    return TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: selectionIndex));
  }
}

String _addString(String text, String newPart) => text.isNotEmpty ? '$newPart $text' : newPart;
