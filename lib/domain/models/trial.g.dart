// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trial _$$_TrialFromJson(Map<String, dynamic> json) => _$_Trial(
      internalId: json['internalId'] as int,
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      contact: json['contact'] == null
          ? null
          : Company.fromJson(json['contact'] as Map<String, dynamic>),
      objective: json['objective'] as String,
      syncStatus: $enumDecode(_$SyncStatusEnumMap, json['syncStatus']),
      modifiedDate: DateTime.parse(json['modifiedDate'] as String),
      planter: json['planter'] == null
          ? null
          : Planter.fromJson(json['planter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TrialToJson(_$_Trial instance) => <String, dynamic>{
      'internalId': instance.internalId,
      'id': instance.id,
      'nickname': instance.nickname,
      'contact': instance.contact,
      'objective': instance.objective,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'modifiedDate': instance.modifiedDate.toIso8601String(),
      'planter': instance.planter,
    };

const _$SyncStatusEnumMap = {
  SyncStatus.waitingInsert: 'waitingInsert',
  SyncStatus.inserting: 'inserting',
  SyncStatus.waitingConfirmed: 'waitingConfirmed',
  SyncStatus.confirmed: 'confirmed',
  SyncStatus.waitingUpdate: 'waitingUpdate',
  SyncStatus.updating: 'updating',
  SyncStatus.changedBeforeInsert: 'changedBeforeInsert',
};
