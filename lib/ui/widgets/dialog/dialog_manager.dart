import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/domain/models/permissions.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/app_padding_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/permission_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/app_dialog.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/app_dialog_action.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/dialog_widget.dart';

abstract class DialogManager {
  static DialogCompleter createPermissionDialog({
    required BuildContext context,
    required Permission permission,
    required VoidCallback onSettings,
    required VoidCallback onClose,
    Function(BuildContext)? dialogContextCallback,
  }) {
    return createAlertDialog(
      context: context,
      title: Strings.error.title(),
      content: permission.textDenied,
      actions: [
        AppDialogAction(
          text: Strings.error.openSettings(),
          action: onSettings,
        ),
        AppPadding.extraSmall.horizontalSpacer,
        AppDialogAction(
          text: Strings.error.close(),
          action: onClose,
        ),
      ],
      dialogContextCallback: dialogContextCallback,
    );
  }

  static DialogCompleter createErrorDialog({
    required BuildContext context,
    required String error,
    required VoidCallback onClose,
    Function(BuildContext)? dialogContextCallback,
  }) {
    return createAlertDialog(
      context: context,
      title: Strings.error.title(),
      content: error,
      actions: [
        AppDialogAction(
          text: Strings.error.close(),
          action: onClose,
        ),
      ],
      dialogContextCallback: dialogContextCallback,
    );
  }

  static DialogCompleter createAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required List<Widget> actions,
    bool barrierDismissible = true,
    bool blockBackButton = false,
    Function(BuildContext)? dialogContextCallback,
  }) {
    return createDialog(
      context: context,
      content: AppDialog(
        title: title,
        content: content,
        actions: actions,
        blockBackButton: blockBackButton,
      ),
      barrierDismissible: barrierDismissible,
      dialogContextCallback: dialogContextCallback,
    );
  }

  static DialogCompleter createDialog({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = true,
    Function(BuildContext)? dialogContextCallback,
  }) {
    final completer = DialogCompleter();
    _createDialog(
      completer: completer,
      context: context,
      content: content,
      barrierDismissible: barrierDismissible,
      dialogContextCallback: dialogContextCallback,
    );
    return completer;
  }

  static DialogCompleter createDatePicker({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required Function(DateTime) onSelected,
    required BuildContext context,
    Function(BuildContext)? dialogContextCallback,
  }) {
    final completer = DialogCompleter();
    _createDatePicker(
      completer: completer,
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      onSelected: onSelected,
      dialogContextCallback: dialogContextCallback,
    );
    return completer;
  }

  static Future<void> _createDialog({
    required DialogCompleter completer,
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = true,
    Function(BuildContext)? dialogContextCallback,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        dialogContextCallback?.call(context);
        return content;
      },
    );
    if (!completer.isCompleted) completer.complete(false);
  }

  static Future<void> _createDatePicker({
    required DialogCompleter completer,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required Function(DateTime) onSelected,
    required BuildContext context,
    Function(BuildContext)? dialogContextCallback,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, widget) {
        dialogContextCallback?.call(context);
        return widget ?? SizedBox();
      },
    );
    if (date != null) {
      onSelected(date);
    }
    if (!completer.isCompleted) completer.complete(false);
  }
}
