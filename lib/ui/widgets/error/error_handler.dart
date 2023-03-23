import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/duration.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/global_key_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/rect_ext.dart';

part 'error_container.dart';
part 'error_page.dart';
part 'error_state.dart';
part 'error_widget.dart';

abstract class ErrorHandler {
  Map<String, String> handle(Map<String, String> errors);

  void _register(_ErrorPageState state);

  void _unregister(_ErrorPageState state);

  static ErrorHandler? of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_ErrorInheritedHandler>();
    return scope?.state;
  }
}
