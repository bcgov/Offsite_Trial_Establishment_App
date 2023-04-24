// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'status':
      return Status.fromJson(json);
    case 'retry':
      return Retry.fromJson(json);
    case 'updated':
      return Updated.fromJson(json);
    case 'confirmUpdated':
      return ConfirmUpdated.fromJson(json);
    case 'endingWork':
      return EndingWork.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Message',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Message {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendingStatus status) status,
    required TResult Function() retry,
    required TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)
        updated,
    required TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)
        confirmUpdated,
    required TResult Function() endingWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendingStatus status)? status,
    TResult? Function()? retry,
    TResult? Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult? Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult? Function()? endingWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendingStatus status)? status,
    TResult Function()? retry,
    TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult Function()? endingWork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Status value) status,
    required TResult Function(Retry value) retry,
    required TResult Function(Updated value) updated,
    required TResult Function(ConfirmUpdated value) confirmUpdated,
    required TResult Function(EndingWork value) endingWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Status value)? status,
    TResult? Function(Retry value)? retry,
    TResult? Function(Updated value)? updated,
    TResult? Function(ConfirmUpdated value)? confirmUpdated,
    TResult? Function(EndingWork value)? endingWork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Status value)? status,
    TResult Function(Retry value)? retry,
    TResult Function(Updated value)? updated,
    TResult Function(ConfirmUpdated value)? confirmUpdated,
    TResult Function(EndingWork value)? endingWork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StatusCopyWith<$Res> {
  factory _$$StatusCopyWith(_$Status value, $Res Function(_$Status) then) =
      __$$StatusCopyWithImpl<$Res>;
  @useResult
  $Res call({SendingStatus status});

  $SendingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$StatusCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res, _$Status>
    implements _$$StatusCopyWith<$Res> {
  __$$StatusCopyWithImpl(_$Status _value, $Res Function(_$Status) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$Status(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SendingStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SendingStatusCopyWith<$Res> get status {
    return $SendingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$Status implements Status {
  const _$Status(this.status, {final String? $type})
      : $type = $type ?? 'status';

  factory _$Status.fromJson(Map<String, dynamic> json) =>
      _$$StatusFromJson(json);

  @override
  final SendingStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.status(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Status &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCopyWith<_$Status> get copyWith =>
      __$$StatusCopyWithImpl<_$Status>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendingStatus status) status,
    required TResult Function() retry,
    required TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)
        updated,
    required TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)
        confirmUpdated,
    required TResult Function() endingWork,
  }) {
    return status(this.status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendingStatus status)? status,
    TResult? Function()? retry,
    TResult? Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult? Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult? Function()? endingWork,
  }) {
    return status?.call(this.status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendingStatus status)? status,
    TResult Function()? retry,
    TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult Function()? endingWork,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this.status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Status value) status,
    required TResult Function(Retry value) retry,
    required TResult Function(Updated value) updated,
    required TResult Function(ConfirmUpdated value) confirmUpdated,
    required TResult Function(EndingWork value) endingWork,
  }) {
    return status(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Status value)? status,
    TResult? Function(Retry value)? retry,
    TResult? Function(Updated value)? updated,
    TResult? Function(ConfirmUpdated value)? confirmUpdated,
    TResult? Function(EndingWork value)? endingWork,
  }) {
    return status?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Status value)? status,
    TResult Function(Retry value)? retry,
    TResult Function(Updated value)? updated,
    TResult Function(ConfirmUpdated value)? confirmUpdated,
    TResult Function(EndingWork value)? endingWork,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusToJson(
      this,
    );
  }
}

abstract class Status implements Message {
  const factory Status(final SendingStatus status) = _$Status;

  factory Status.fromJson(Map<String, dynamic> json) = _$Status.fromJson;

  SendingStatus get status;
  @JsonKey(ignore: true)
  _$$StatusCopyWith<_$Status> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RetryCopyWith<$Res> {
  factory _$$RetryCopyWith(_$Retry value, $Res Function(_$Retry) then) =
      __$$RetryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetryCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res, _$Retry>
    implements _$$RetryCopyWith<$Res> {
  __$$RetryCopyWithImpl(_$Retry _value, $Res Function(_$Retry) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Retry implements Retry {
  const _$Retry({final String? $type}) : $type = $type ?? 'retry';

  factory _$Retry.fromJson(Map<String, dynamic> json) => _$$RetryFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.retry()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Retry);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendingStatus status) status,
    required TResult Function() retry,
    required TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)
        updated,
    required TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)
        confirmUpdated,
    required TResult Function() endingWork,
  }) {
    return retry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendingStatus status)? status,
    TResult? Function()? retry,
    TResult? Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult? Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult? Function()? endingWork,
  }) {
    return retry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendingStatus status)? status,
    TResult Function()? retry,
    TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult Function()? endingWork,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Status value) status,
    required TResult Function(Retry value) retry,
    required TResult Function(Updated value) updated,
    required TResult Function(ConfirmUpdated value) confirmUpdated,
    required TResult Function(EndingWork value) endingWork,
  }) {
    return retry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Status value)? status,
    TResult? Function(Retry value)? retry,
    TResult? Function(Updated value)? updated,
    TResult? Function(ConfirmUpdated value)? confirmUpdated,
    TResult? Function(EndingWork value)? endingWork,
  }) {
    return retry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Status value)? status,
    TResult Function(Retry value)? retry,
    TResult Function(Updated value)? updated,
    TResult Function(ConfirmUpdated value)? confirmUpdated,
    TResult Function(EndingWork value)? endingWork,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RetryToJson(
      this,
    );
  }
}

abstract class Retry implements Message {
  const factory Retry() = _$Retry;

  factory Retry.fromJson(Map<String, dynamic> json) = _$Retry.fromJson;
}

/// @nodoc
abstract class _$$UpdatedCopyWith<$Res> {
  factory _$$UpdatedCopyWith(_$Updated value, $Res Function(_$Updated) then) =
      __$$UpdatedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Planter> planters, List<Trial> trials, List<Planting> plantings});
}

/// @nodoc
class __$$UpdatedCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$Updated>
    implements _$$UpdatedCopyWith<$Res> {
  __$$UpdatedCopyWithImpl(_$Updated _value, $Res Function(_$Updated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planters = null,
    Object? trials = null,
    Object? plantings = null,
  }) {
    return _then(_$Updated(
      planters: null == planters
          ? _value._planters
          : planters // ignore: cast_nullable_to_non_nullable
              as List<Planter>,
      trials: null == trials
          ? _value._trials
          : trials // ignore: cast_nullable_to_non_nullable
              as List<Trial>,
      plantings: null == plantings
          ? _value._plantings
          : plantings // ignore: cast_nullable_to_non_nullable
              as List<Planting>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Updated implements Updated {
  const _$Updated(
      {final List<Planter> planters = const [],
      final List<Trial> trials = const [],
      final List<Planting> plantings = const [],
      final String? $type})
      : _planters = planters,
        _trials = trials,
        _plantings = plantings,
        $type = $type ?? 'updated';

  factory _$Updated.fromJson(Map<String, dynamic> json) =>
      _$$UpdatedFromJson(json);

  final List<Planter> _planters;
  @override
  @JsonKey()
  List<Planter> get planters {
    if (_planters is EqualUnmodifiableListView) return _planters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planters);
  }

  final List<Trial> _trials;
  @override
  @JsonKey()
  List<Trial> get trials {
    if (_trials is EqualUnmodifiableListView) return _trials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trials);
  }

  final List<Planting> _plantings;
  @override
  @JsonKey()
  List<Planting> get plantings {
    if (_plantings is EqualUnmodifiableListView) return _plantings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plantings);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.updated(planters: $planters, trials: $trials, plantings: $plantings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Updated &&
            const DeepCollectionEquality().equals(other._planters, _planters) &&
            const DeepCollectionEquality().equals(other._trials, _trials) &&
            const DeepCollectionEquality()
                .equals(other._plantings, _plantings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_planters),
      const DeepCollectionEquality().hash(_trials),
      const DeepCollectionEquality().hash(_plantings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedCopyWith<_$Updated> get copyWith =>
      __$$UpdatedCopyWithImpl<_$Updated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendingStatus status) status,
    required TResult Function() retry,
    required TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)
        updated,
    required TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)
        confirmUpdated,
    required TResult Function() endingWork,
  }) {
    return updated(planters, trials, plantings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendingStatus status)? status,
    TResult? Function()? retry,
    TResult? Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult? Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult? Function()? endingWork,
  }) {
    return updated?.call(planters, trials, plantings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendingStatus status)? status,
    TResult Function()? retry,
    TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult Function()? endingWork,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(planters, trials, plantings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Status value) status,
    required TResult Function(Retry value) retry,
    required TResult Function(Updated value) updated,
    required TResult Function(ConfirmUpdated value) confirmUpdated,
    required TResult Function(EndingWork value) endingWork,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Status value)? status,
    TResult? Function(Retry value)? retry,
    TResult? Function(Updated value)? updated,
    TResult? Function(ConfirmUpdated value)? confirmUpdated,
    TResult? Function(EndingWork value)? endingWork,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Status value)? status,
    TResult Function(Retry value)? retry,
    TResult Function(Updated value)? updated,
    TResult Function(ConfirmUpdated value)? confirmUpdated,
    TResult Function(EndingWork value)? endingWork,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatedToJson(
      this,
    );
  }
}

abstract class Updated implements Message {
  const factory Updated(
      {final List<Planter> planters,
      final List<Trial> trials,
      final List<Planting> plantings}) = _$Updated;

  factory Updated.fromJson(Map<String, dynamic> json) = _$Updated.fromJson;

  List<Planter> get planters;
  List<Trial> get trials;
  List<Planting> get plantings;
  @JsonKey(ignore: true)
  _$$UpdatedCopyWith<_$Updated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmUpdatedCopyWith<$Res> {
  factory _$$ConfirmUpdatedCopyWith(
          _$ConfirmUpdated value, $Res Function(_$ConfirmUpdated) then) =
      __$$ConfirmUpdatedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> planterIds, List<int> trialIds, List<int> plantingIds});
}

/// @nodoc
class __$$ConfirmUpdatedCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$ConfirmUpdated>
    implements _$$ConfirmUpdatedCopyWith<$Res> {
  __$$ConfirmUpdatedCopyWithImpl(
      _$ConfirmUpdated _value, $Res Function(_$ConfirmUpdated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planterIds = null,
    Object? trialIds = null,
    Object? plantingIds = null,
  }) {
    return _then(_$ConfirmUpdated(
      planterIds: null == planterIds
          ? _value._planterIds
          : planterIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      trialIds: null == trialIds
          ? _value._trialIds
          : trialIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      plantingIds: null == plantingIds
          ? _value._plantingIds
          : plantingIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmUpdated implements ConfirmUpdated {
  const _$ConfirmUpdated(
      {final List<int> planterIds = const [],
      final List<int> trialIds = const [],
      final List<int> plantingIds = const [],
      final String? $type})
      : _planterIds = planterIds,
        _trialIds = trialIds,
        _plantingIds = plantingIds,
        $type = $type ?? 'confirmUpdated';

  factory _$ConfirmUpdated.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmUpdatedFromJson(json);

  final List<int> _planterIds;
  @override
  @JsonKey()
  List<int> get planterIds {
    if (_planterIds is EqualUnmodifiableListView) return _planterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planterIds);
  }

  final List<int> _trialIds;
  @override
  @JsonKey()
  List<int> get trialIds {
    if (_trialIds is EqualUnmodifiableListView) return _trialIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trialIds);
  }

  final List<int> _plantingIds;
  @override
  @JsonKey()
  List<int> get plantingIds {
    if (_plantingIds is EqualUnmodifiableListView) return _plantingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plantingIds);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.confirmUpdated(planterIds: $planterIds, trialIds: $trialIds, plantingIds: $plantingIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmUpdated &&
            const DeepCollectionEquality()
                .equals(other._planterIds, _planterIds) &&
            const DeepCollectionEquality().equals(other._trialIds, _trialIds) &&
            const DeepCollectionEquality()
                .equals(other._plantingIds, _plantingIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_planterIds),
      const DeepCollectionEquality().hash(_trialIds),
      const DeepCollectionEquality().hash(_plantingIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmUpdatedCopyWith<_$ConfirmUpdated> get copyWith =>
      __$$ConfirmUpdatedCopyWithImpl<_$ConfirmUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendingStatus status) status,
    required TResult Function() retry,
    required TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)
        updated,
    required TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)
        confirmUpdated,
    required TResult Function() endingWork,
  }) {
    return confirmUpdated(planterIds, trialIds, plantingIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendingStatus status)? status,
    TResult? Function()? retry,
    TResult? Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult? Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult? Function()? endingWork,
  }) {
    return confirmUpdated?.call(planterIds, trialIds, plantingIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendingStatus status)? status,
    TResult Function()? retry,
    TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult Function()? endingWork,
    required TResult orElse(),
  }) {
    if (confirmUpdated != null) {
      return confirmUpdated(planterIds, trialIds, plantingIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Status value) status,
    required TResult Function(Retry value) retry,
    required TResult Function(Updated value) updated,
    required TResult Function(ConfirmUpdated value) confirmUpdated,
    required TResult Function(EndingWork value) endingWork,
  }) {
    return confirmUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Status value)? status,
    TResult? Function(Retry value)? retry,
    TResult? Function(Updated value)? updated,
    TResult? Function(ConfirmUpdated value)? confirmUpdated,
    TResult? Function(EndingWork value)? endingWork,
  }) {
    return confirmUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Status value)? status,
    TResult Function(Retry value)? retry,
    TResult Function(Updated value)? updated,
    TResult Function(ConfirmUpdated value)? confirmUpdated,
    TResult Function(EndingWork value)? endingWork,
    required TResult orElse(),
  }) {
    if (confirmUpdated != null) {
      return confirmUpdated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmUpdatedToJson(
      this,
    );
  }
}

abstract class ConfirmUpdated implements Message {
  const factory ConfirmUpdated(
      {final List<int> planterIds,
      final List<int> trialIds,
      final List<int> plantingIds}) = _$ConfirmUpdated;

  factory ConfirmUpdated.fromJson(Map<String, dynamic> json) =
      _$ConfirmUpdated.fromJson;

  List<int> get planterIds;
  List<int> get trialIds;
  List<int> get plantingIds;
  @JsonKey(ignore: true)
  _$$ConfirmUpdatedCopyWith<_$ConfirmUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndingWorkCopyWith<$Res> {
  factory _$$EndingWorkCopyWith(
          _$EndingWork value, $Res Function(_$EndingWork) then) =
      __$$EndingWorkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndingWorkCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$EndingWork>
    implements _$$EndingWorkCopyWith<$Res> {
  __$$EndingWorkCopyWithImpl(
      _$EndingWork _value, $Res Function(_$EndingWork) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EndingWork implements EndingWork {
  const _$EndingWork({final String? $type}) : $type = $type ?? 'endingWork';

  factory _$EndingWork.fromJson(Map<String, dynamic> json) =>
      _$$EndingWorkFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.endingWork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndingWork);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendingStatus status) status,
    required TResult Function() retry,
    required TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)
        updated,
    required TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)
        confirmUpdated,
    required TResult Function() endingWork,
  }) {
    return endingWork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendingStatus status)? status,
    TResult? Function()? retry,
    TResult? Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult? Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult? Function()? endingWork,
  }) {
    return endingWork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendingStatus status)? status,
    TResult Function()? retry,
    TResult Function(List<Planter> planters, List<Trial> trials,
            List<Planting> plantings)?
        updated,
    TResult Function(
            List<int> planterIds, List<int> trialIds, List<int> plantingIds)?
        confirmUpdated,
    TResult Function()? endingWork,
    required TResult orElse(),
  }) {
    if (endingWork != null) {
      return endingWork();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Status value) status,
    required TResult Function(Retry value) retry,
    required TResult Function(Updated value) updated,
    required TResult Function(ConfirmUpdated value) confirmUpdated,
    required TResult Function(EndingWork value) endingWork,
  }) {
    return endingWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Status value)? status,
    TResult? Function(Retry value)? retry,
    TResult? Function(Updated value)? updated,
    TResult? Function(ConfirmUpdated value)? confirmUpdated,
    TResult? Function(EndingWork value)? endingWork,
  }) {
    return endingWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Status value)? status,
    TResult Function(Retry value)? retry,
    TResult Function(Updated value)? updated,
    TResult Function(ConfirmUpdated value)? confirmUpdated,
    TResult Function(EndingWork value)? endingWork,
    required TResult orElse(),
  }) {
    if (endingWork != null) {
      return endingWork(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EndingWorkToJson(
      this,
    );
  }
}

abstract class EndingWork implements Message {
  const factory EndingWork() = _$EndingWork;

  factory EndingWork.fromJson(Map<String, dynamic> json) =
      _$EndingWork.fromJson;
}
