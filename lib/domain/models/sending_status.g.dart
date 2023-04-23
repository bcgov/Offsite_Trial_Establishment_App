// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sending_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendingSendingStatus _$$SendingSendingStatusFromJson(
        Map<String, dynamic> json) =>
    _$SendingSendingStatus(
      completedCount: json['completedCount'] as int,
      allCount: json['allCount'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendingSendingStatusToJson(
        _$SendingSendingStatus instance) =>
    <String, dynamic>{
      'completedCount': instance.completedCount,
      'allCount': instance.allCount,
      'runtimeType': instance.$type,
    };

_$NoLoadingSendingStatus _$$NoLoadingSendingStatusFromJson(
        Map<String, dynamic> json) =>
    _$NoLoadingSendingStatus(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoLoadingSendingStatusToJson(
        _$NoLoadingSendingStatus instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SuccessSendingStatus _$$SuccessSendingStatusFromJson(
        Map<String, dynamic> json) =>
    _$SuccessSendingStatus(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessSendingStatusToJson(
        _$SuccessSendingStatus instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ErrorSendingStatus _$$ErrorSendingStatusFromJson(Map<String, dynamic> json) =>
    _$ErrorSendingStatus(
      message: json['message'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorSendingStatusToJson(
        _$ErrorSendingStatus instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
