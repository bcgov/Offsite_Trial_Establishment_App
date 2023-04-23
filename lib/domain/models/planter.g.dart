// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Planter _$$_PlanterFromJson(Map<String, dynamic> json) => _$_Planter(
      internalId: json['internalId'] as int,
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      organization: json['organization'] as String,
      syncStatus: $enumDecode(_$SyncStatusEnumMap, json['syncStatus']),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$_PlanterToJson(_$_Planter instance) =>
    <String, dynamic>{
      'internalId': instance.internalId,
      'id': instance.id,
      'nickname': instance.nickname,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'email': instance.email,
      'phone': instance.phone,
      'organization': instance.organization,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'isActive': instance.isActive,
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
