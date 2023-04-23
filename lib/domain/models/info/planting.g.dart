// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Planting _$$_PlantingFromJson(Map<String, dynamic> json) => _$_Planting(
      internalId: json['internalId'] as int,
      plantingId: json['plantingId'] as String,
      blockId: json['blockId'] as String,
      date: DateTime.parse(json['date'] as String),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      photoPaths: (json['photoPaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      site: json['site'] == null
          ? null
          : Site.fromJson(json['site'] as Map<String, dynamic>),
      seedlings: json['seedlings'] == null
          ? null
          : Seedlings.fromJson(json['seedlings'] as Map<String, dynamic>),
      trial: json['trial'] == null
          ? null
          : Trial.fromJson(json['trial'] as Map<String, dynamic>),
      planter: json['planter'] == null
          ? null
          : Planter.fromJson(json['planter'] as Map<String, dynamic>),
      syncStatus: $enumDecode(_$SyncStatusEnumMap, json['syncStatus']),
      modifiedDate: DateTime.parse(json['modifiedDate'] as String),
    );

Map<String, dynamic> _$$_PlantingToJson(_$_Planting instance) =>
    <String, dynamic>{
      'internalId': instance.internalId,
      'plantingId': instance.plantingId,
      'blockId': instance.blockId,
      'date': instance.date.toIso8601String(),
      'location': instance.location,
      'photoPaths': instance.photoPaths,
      'site': instance.site,
      'seedlings': instance.seedlings,
      'trial': instance.trial,
      'planter': instance.planter,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'modifiedDate': instance.modifiedDate.toIso8601String(),
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
