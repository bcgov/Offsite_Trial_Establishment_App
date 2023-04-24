// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trial _$TrialFromJson(Map<String, dynamic> json) {
  return _Trial.fromJson(json);
}

/// @nodoc
mixin _$Trial {
  int get internalId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  Company? get contact => throw _privateConstructorUsedError;
  String get objective => throw _privateConstructorUsedError;
  SyncStatus get syncStatus => throw _privateConstructorUsedError;
  DateTime get modifiedDate => throw _privateConstructorUsedError;
  Planter? get planter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrialCopyWith<Trial> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrialCopyWith<$Res> {
  factory $TrialCopyWith(Trial value, $Res Function(Trial) then) =
      _$TrialCopyWithImpl<$Res, Trial>;
  @useResult
  $Res call(
      {int internalId,
      String id,
      String nickname,
      Company? contact,
      String objective,
      SyncStatus syncStatus,
      DateTime modifiedDate,
      Planter? planter});

  $CompanyCopyWith<$Res>? get contact;
  $PlanterCopyWith<$Res>? get planter;
}

/// @nodoc
class _$TrialCopyWithImpl<$Res, $Val extends Trial>
    implements $TrialCopyWith<$Res> {
  _$TrialCopyWithImpl(this._value, this._then);

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
    Object? contact = freezed,
    Object? objective = null,
    Object? syncStatus = null,
    Object? modifiedDate = null,
    Object? planter = freezed,
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
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Company?,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planter: freezed == planter
          ? _value.planter
          : planter // ignore: cast_nullable_to_non_nullable
              as Planter?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $CompanyCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlanterCopyWith<$Res>? get planter {
    if (_value.planter == null) {
      return null;
    }

    return $PlanterCopyWith<$Res>(_value.planter!, (value) {
      return _then(_value.copyWith(planter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TrialCopyWith<$Res> implements $TrialCopyWith<$Res> {
  factory _$$_TrialCopyWith(_$_Trial value, $Res Function(_$_Trial) then) =
      __$$_TrialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int internalId,
      String id,
      String nickname,
      Company? contact,
      String objective,
      SyncStatus syncStatus,
      DateTime modifiedDate,
      Planter? planter});

  @override
  $CompanyCopyWith<$Res>? get contact;
  @override
  $PlanterCopyWith<$Res>? get planter;
}

/// @nodoc
class __$$_TrialCopyWithImpl<$Res> extends _$TrialCopyWithImpl<$Res, _$_Trial>
    implements _$$_TrialCopyWith<$Res> {
  __$$_TrialCopyWithImpl(_$_Trial _value, $Res Function(_$_Trial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? id = null,
    Object? nickname = null,
    Object? contact = freezed,
    Object? objective = null,
    Object? syncStatus = null,
    Object? modifiedDate = null,
    Object? planter = freezed,
  }) {
    return _then(_$_Trial(
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
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Company?,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planter: freezed == planter
          ? _value.planter
          : planter // ignore: cast_nullable_to_non_nullable
              as Planter?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trial implements _Trial {
  const _$_Trial(
      {required this.internalId,
      required this.id,
      required this.nickname,
      required this.contact,
      required this.objective,
      required this.syncStatus,
      required this.modifiedDate,
      required this.planter});

  factory _$_Trial.fromJson(Map<String, dynamic> json) =>
      _$$_TrialFromJson(json);

  @override
  final int internalId;
  @override
  final String id;
  @override
  final String nickname;
  @override
  final Company? contact;
  @override
  final String objective;
  @override
  final SyncStatus syncStatus;
  @override
  final DateTime modifiedDate;
  @override
  final Planter? planter;

  @override
  String toString() {
    return 'Trial(internalId: $internalId, id: $id, nickname: $nickname, contact: $contact, objective: $objective, syncStatus: $syncStatus, modifiedDate: $modifiedDate, planter: $planter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trial &&
            (identical(other.internalId, internalId) ||
                other.internalId == internalId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.objective, objective) ||
                other.objective == objective) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.planter, planter) || other.planter == planter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, internalId, id, nickname,
      contact, objective, syncStatus, modifiedDate, planter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrialCopyWith<_$_Trial> get copyWith =>
      __$$_TrialCopyWithImpl<_$_Trial>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrialToJson(
      this,
    );
  }
}

abstract class _Trial implements Trial {
  const factory _Trial(
      {required final int internalId,
      required final String id,
      required final String nickname,
      required final Company? contact,
      required final String objective,
      required final SyncStatus syncStatus,
      required final DateTime modifiedDate,
      required final Planter? planter}) = _$_Trial;

  factory _Trial.fromJson(Map<String, dynamic> json) = _$_Trial.fromJson;

  @override
  int get internalId;
  @override
  String get id;
  @override
  String get nickname;
  @override
  Company? get contact;
  @override
  String get objective;
  @override
  SyncStatus get syncStatus;
  @override
  DateTime get modifiedDate;
  @override
  Planter? get planter;
  @override
  @JsonKey(ignore: true)
  _$$_TrialCopyWith<_$_Trial> get copyWith =>
      throw _privateConstructorUsedError;
}
