import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sending_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message.status(SendingStatus status) = Status;

  const factory Message.retry() = Retry;

  const factory Message.updated({
    @Default([]) List<Planter> planters,
    @Default([]) List<Trial> trials,
    @Default([]) List<Planting> plantings,
  }) = Updated;

  const factory Message.confirmUpdated({
    @Default([]) List<int> planterIds,
    @Default([]) List<int> trialIds,
    @Default([]) List<int> plantingIds,
  }) = ConfirmUpdated;

  const factory Message.endingWork() = EndingWork;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
