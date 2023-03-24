import 'dart:async';

import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/date.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/domain/models/dialog.dart' as model;
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/app_dialog_action.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/dialog_manager.dart';

typedef DialogCompleter = Completer<bool>;

class DialogWidget extends StatefulWidget {
  final Function() closeDialog;
  final model.Dialog? dialog;
  final Widget child;

  const DialogWidget({
    super.key,
    required this.child,
    required this.dialog,
    required this.closeDialog,
  });

  @override
  State<StatefulWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  model.Dialog? get dialog => widget.dialog;
  bool dialogShow = false;
  DialogCompleter? dialogCompleter;
  BuildContext? dialogContext;

  @override
  void didUpdateWidget(covariant DialogWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _buildDialogsIfNeed(oldWidget.dialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _closeDialog([bool isReopen = false]) {
    if (dialogShow) {
      Navigator.of(dialogContext ?? context).pop();
    }
    dialogContext = null;
    if (dialogCompleter?.isCompleted == false) dialogCompleter?.complete(isReopen);
    if (!isReopen) {
      widget.closeDialog();
    }
  }

  Future<void> _openDialog() async {
    dialogCompleter = dialog?.when(
      error: _openErrorDialog,
      datePicker: _openDatePicker,
      logout: _openLogout,
    );
    dialogShow = true;
    dialogShow = await dialogCompleter?.future ?? false;
    _closeDialog(dialogShow);
  }

  void _dialogContextCallback(BuildContext context) {
    dialogContext = context;
  }

  DialogCompleter _openErrorDialog(String? message) {
    return DialogManager.createErrorDialog(
      context: context,
      dialogContextCallback: _dialogContextCallback,
      error: message ?? Strings.error.defaultMessage(),
      onClose: _closeDialog,
    );
  }

  DialogCompleter _openLogout(Function() onLogout) {
    return DialogManager.createAlertDialog(
      context: context,
      dialogContextCallback: _dialogContextCallback,
      title: Strings.logout.title(),
      content: Strings.logout.text(),
      actions: [
        AppDialogAction(
          text: Strings.logout.ok(),
          action: () async {
            onLogout();
            _closeDialog();
          },
        ),
        AppDialogAction(
          text: Strings.logout.cancel(),
          action: _closeDialog,
        ),
      ],
    );
  }

  DialogCompleter _openDatePicker(
    DateTime initialDate,
    Function(DateTime) onSelected,
  ) {
    return DialogManager.createDatePicker(
      context: context,
      dialogContextCallback: _dialogContextCallback,
      initialDate: initialDate,
      firstDate: AppDate.minPickerDate,
      lastDate: AppDate.maxPickerDate,
      onSelected: onSelected,
    );
  }

  void _reopenDialog(model.Dialog oldDialog) {
    _closeDialog(true);
    _openDialog();
  }

  Future<void> _buildDialogsIfNeed(model.Dialog? oldDialog) async {
    await Future.delayed(Duration.zero); // to build after widget rebuild loop
    if (oldDialog != dialog || (dialog != null && !dialogShow) || (dialog == null && dialogShow)) {
      if (dialog == null) {
        _closeDialog();
      } else {
        if (oldDialog == null) {
          _openDialog();
        } else {
          _reopenDialog(oldDialog);
        }
      }
    }
  }
}
