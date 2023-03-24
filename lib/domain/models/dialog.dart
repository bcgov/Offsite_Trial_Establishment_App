import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog.freezed.dart';

@freezed
class Dialog with _$Dialog {
  const factory Dialog.error([
    String? message,
  ]) = ErrorDetails;

  const factory Dialog.datePicker({
    required DateTime initialDate,
    required Function(DateTime) onSelected,
  }) = DatePickerDialog;

  const factory Dialog.logout({
    required Function() onLogout,
  }) = Logout;
}
