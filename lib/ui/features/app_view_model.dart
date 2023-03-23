import 'package:mobx/mobx.dart';
import 'package:offsite_trial_establishment_app/domain/models/dialog.dart';

abstract class AppViewModel {
  final _dialog = Observable<Dialog?>(null);

  Dialog? get dialog => _dialog.value;

  set dialog(Dialog? dialog) => _dialog.value = dialog;

  late Action closeDialog;

  AppViewModel() {
    closeDialog = Action(_closeDialog);
  }

  void dispose() {}

  void _closeDialog() {
    dialog = null;
  }
}
