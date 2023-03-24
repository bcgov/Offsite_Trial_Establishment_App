import 'package:flutter/services.dart';
import 'package:offsite_trial_establishment_app/common/constants/accuracy.dart';
import 'package:offsite_trial_establishment_app/common/constants/lengths.dart';
import 'package:offsite_trial_establishment_app/common/utils/text_masks.dart';

abstract class AppFormat {
  static final base = [
    LengthLimitingTextInputFormatter(Length.textLength),
  ];
  static final phone = [
    FilteringTextInputFormatter.digitsOnly,
    CanadaPhoneFormatter(),
    LengthLimitingTextInputFormatter(Length.phoneWithMask),
  ];

  static final elevation = number(
    signed: true,
    suffix: ' m',
  );
  static final spacing = double(
    accuracy: Accuracy.spacing,
    signed: false,
    suffix: ' m',
  );

  static List<TextInputFormatter> number({
    bool signed = false,
    String? suffix,
  }) =>
      [
        if (signed) FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')) else FilteringTextInputFormatter.digitsOnly,
        IntegerFormatter(signed: signed, suffix: suffix),
        LengthLimitingTextInputFormatter(Length.number),
      ];

  static List<TextInputFormatter> double({
    int accuracy = 3,
    bool signed = false,
    String? suffix,
  }) =>
      [
        if (signed)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,-]'))
        else
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
        DoubleFormatter(
          accuracy: accuracy,
          signed: signed,
          suffix: suffix,
        ),
      ];
}
