import 'package:flutter/widgets.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';

extension TextEditingControllerValue on TextEditingController {
  void updateText(String? text, {bool saveLastPosition = true}) {
    final length = text?.length ?? 0;
    if ((saveLastPosition && value.selection.baseOffset == value.text.length) || length <= value.selection.baseOffset) {
      value = value.copyWith(
        text: text,
        selection: TextSelection(
          baseOffset: length,
          extentOffset: length,
        ),
      );
    } else {
      value = value.copyWith(text: text);
    }
  }

  void trim() {
    final endWhitespaces = value.text.endWhitespace;
    final isLast = value.text.length - endWhitespaces <= value.selection.baseOffset;
    final newText = value.text.trim();
    final selection = isLast ? newText.length : value.selection.baseOffset - value.text.startWhitespace;
    value = value.copyWith(
      text: newText,
      selection: TextSelection(
        baseOffset: selection,
        extentOffset: selection,
      ),
    );
  }
}
