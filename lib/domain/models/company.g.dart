// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      internalId: json['internalId'] as int,
      id: json['id'] as String,
      organization: json['organization'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'internalId': instance.internalId,
      'id': instance.id,
      'organization': instance.organization,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'email': instance.email,
      'phone': instance.phone,
    };
