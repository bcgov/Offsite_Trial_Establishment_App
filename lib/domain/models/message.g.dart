// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Status _$$StatusFromJson(Map<String, dynamic> json) => _$Status(
      SendingStatus.fromJson(json['status'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StatusToJson(_$Status instance) => <String, dynamic>{
      'status': instance.status,
      'runtimeType': instance.$type,
    };

_$Retry _$$RetryFromJson(Map<String, dynamic> json) => _$Retry(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RetryToJson(_$Retry instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Updated _$$UpdatedFromJson(Map<String, dynamic> json) => _$Updated(
      planters: (json['planters'] as List<dynamic>?)
              ?.map((e) => Planter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      trials: (json['trials'] as List<dynamic>?)
              ?.map((e) => Trial.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      plantings: (json['plantings'] as List<dynamic>?)
              ?.map((e) => Planting.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UpdatedToJson(_$Updated instance) => <String, dynamic>{
      'planters': instance.planters,
      'trials': instance.trials,
      'plantings': instance.plantings,
      'runtimeType': instance.$type,
    };

_$ConfirmUpdated _$$ConfirmUpdatedFromJson(Map<String, dynamic> json) =>
    _$ConfirmUpdated(
      planterIds: (json['planterIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      trialIds:
          (json['trialIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      plantingIds: (json['plantingIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConfirmUpdatedToJson(_$ConfirmUpdated instance) =>
    <String, dynamic>{
      'planterIds': instance.planterIds,
      'trialIds': instance.trialIds,
      'plantingIds': instance.plantingIds,
      'runtimeType': instance.$type,
    };

_$EndingWork _$$EndingWorkFromJson(Map<String, dynamic> json) => _$EndingWork(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EndingWorkToJson(_$EndingWork instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
