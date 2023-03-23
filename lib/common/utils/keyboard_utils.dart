import 'package:flutter/material.dart';

abstract class KeyboardUtils {
  static void hide() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void next(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }
}
