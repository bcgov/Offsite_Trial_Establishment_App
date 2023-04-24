// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Planter _$PlanterFromJson(Map<String, dynamic> json) {
  return _Planter.fromJson(json);
}

/// @nodoc
mixin _$Planter {
  int get internalId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  SyncStatus get syncStatus => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanterCopyWith<Planter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanterCopyWith<$Res> {
  factory $PlanterCopyWith(Planter value, $Res Function(Planter) then) =
      _$PlanterCopyWithImpl<$Res, Planter>;
  @useResult
  $Res call(
      {int internalId,
      String id,
      String nickname,
      String lastName,
      String firstName,
      String email,
      String phone,
      String organization,
      SyncStatus syncStatus,
      bool isActive});
}

/// @nodoc
class _$PlanterCopyWithImpl<$Res, $Val extends Planter>
    implements $PlanterCopyWith<$Res> {
  _$PlanterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? id = null,
    Object? nickname = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? phone = null,
    Object? organization = null,
    Object? syncStatus = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlanterCopyWith<$Res> implements $PlanterCopyWith<$Res> {
  factory _$$_PlanterCopyWith(
          _$_Planter value, $Res Function(_$_Planter) then) =
      __$$_PlanterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int internalId,
      String id,
      String nickname,
      String lastName,
      String firstName,
      String email,
      String phone,
      String organization,
      SyncStatus syncStatus,
      bool isActive});
}

/// @nodoc
class __$$_PlanterCopyWithImpl<$Res>
    extends _$PlanterCopyWithImpl<$Res, _$_Planter>
    implements _$$_PlanterCopyWith<$Res> {
  __$$_PlanterCopyWithImpl(_$_Planter _value, $Res Function(_$_Planter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? id = null,
    Object? nickname = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? phone = null,
    Object? organization = null,
    Object? syncStatus = null,
    Object? isActive = null,
  }) {
    return _then(_$_Planter(
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Planter implements _Planter {
  const _$_Planter(
      {required this.internalId,
      required this.id,
      required this.nickname,
      required this.lastName,
      required this.firstName,
      required this.email,
      required this.phone,
      required this.organization,
      required this.syncStatus,
      required this.isActive});

  factory _$_Planter.fromJson(Map<String, dynamic> json) =>
      _$$_PlanterFromJson(json);

  @override
  final int internalId;
  @override
  final String id;
  @override
  final String nickname;
  @override
  final String lastName;
  @override
  final String firstName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String organization;
  @override
  final SyncStatus syncStatus;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'Planter(internalId: $internalId, id: $id, nickname: $nickname, lastName: $lastName, firstName: $firstName, email: $email, phone: $phone, organization: $organization, syncStatus: $syncStatus, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Planter &&
            (identical(other.internalId, internalId) ||
                other.internalId == internalId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, internalId, id, nickname,
      lastName, firstName, email, phone, organization, syncStatus, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlanterCopyWith<_$_Planter> get copyWith =>
      __$$_PlanterCopyWithImpl<_$_Planter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanterToJson(
      this,
    );
  }
}

abstract class _Planter implements Planter {
  const factory _Planter(
      {required final int internalId,
      required final String id,
      required final String nickname,
      required final String lastName,
      required final String firstName,
      required final String email,
      required final String phone,
      required final String organization,
      required final SyncStatus syncStatus,
      required final bool isActive}) = _$_Planter;

  factory _Planter.fromJson(Map<String, dynamic> json) = _$_Planter.fromJson;

  @override
  int get internalId;
  @override
  String get id;
  @override
  String get nickname;
  @override
  String get lastName;
  @override
  String get firstName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get organization;
  @override
  SyncStatus get syncStatus;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_PlanterCopyWith<_$_Planter> get copyWith =>
      throw _privateConstructorUsedError;
}
