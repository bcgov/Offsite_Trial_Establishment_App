import 'package:freezed_annotation/freezed_annotation.dart';

part 'sending_status.freezed.dart';
part 'sending_status.g.dart';

@freezed
class SendingStatus with _$SendingStatus {
  const factory SendingStatus.sending({
    required int completedCount,
    required int allCount,
  }) = SendingSendingStatus;

  const factory SendingStatus.noLoading() = NoLoadingSendingStatus;

  const factory SendingStatus.success() = SuccessSendingStatus;

  const factory SendingStatus.error({
    required String? message,
  }) = ErrorSendingStatus;

  factory SendingStatus.fromJson(Map<String, dynamic> json) => _$SendingStatusFromJson(json);
}
