// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sending_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendingStatus _$SendingStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'sending':
      return SendingSendingStatus.fromJson(json);
    case 'noLoading':
      return NoLoadingSendingStatus.fromJson(json);
    case 'success':
      return SuccessSendingStatus.fromJson(json);
    case 'error':
      return ErrorSendingStatus.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SendingStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SendingStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int completedCount, int allCount) sending,
    required TResult Function() noLoading,
    required TResult Function() success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int completedCount, int allCount)? sending,
    TResult? Function()? noLoading,
    TResult? Function()? success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int completedCount, int allCount)? sending,
    TResult Function()? noLoading,
    TResult Function()? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendingSendingStatus value) sending,
    required TResult Function(NoLoadingSendingStatus value) noLoading,
    required TResult Function(SuccessSendingStatus value) success,
    required TResult Function(ErrorSendingStatus value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendingSendingStatus value)? sending,
    TResult? Function(NoLoadingSendingStatus value)? noLoading,
    TResult? Function(SuccessSendingStatus value)? success,
    TResult? Function(ErrorSendingStatus value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendingSendingStatus value)? sending,
    TResult Function(NoLoadingSendingStatus value)? noLoading,
    TResult Function(SuccessSendingStatus value)? success,
    TResult Function(ErrorSendingStatus value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendingStatusCopyWith<$Res> {
  factory $SendingStatusCopyWith(
          SendingStatus value, $Res Function(SendingStatus) then) =
      _$SendingStatusCopyWithImpl<$Res, SendingStatus>;
}

/// @nodoc
class _$SendingStatusCopyWithImpl<$Res, $Val extends SendingStatus>
    implements $SendingStatusCopyWith<$Res> {
  _$SendingStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendingSendingStatusCopyWith<$Res> {
  factory _$$SendingSendingStatusCopyWith(_$SendingSendingStatus value,
          $Res Function(_$SendingSendingStatus) then) =
      __$$SendingSendingStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({int completedCount, int allCount});
}

/// @nodoc
class __$$SendingSendingStatusCopyWithImpl<$Res>
    extends _$SendingStatusCopyWithImpl<$Res, _$SendingSendingStatus>
    implements _$$SendingSendingStatusCopyWith<$Res> {
  __$$SendingSendingStatusCopyWithImpl(_$SendingSendingStatus _value,
      $Res Function(_$SendingSendingStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedCount = null,
    Object? allCount = null,
  }) {
    return _then(_$SendingSendingStatus(
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      allCount: null == allCount
          ? _value.allCount
          : allCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendingSendingStatus implements SendingSendingStatus {
  const _$SendingSendingStatus(
      {required this.completedCount,
      required this.allCount,
      final String? $type})
      : $type = $type ?? 'sending';

  factory _$SendingSendingStatus.fromJson(Map<String, dynamic> json) =>
      _$$SendingSendingStatusFromJson(json);

  @override
  final int completedCount;
  @override
  final int allCount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SendingStatus.sending(completedCount: $completedCount, allCount: $allCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendingSendingStatus &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.allCount, allCount) ||
                other.allCount == allCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, completedCount, allCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendingSendingStatusCopyWith<_$SendingSendingStatus> get copyWith =>
      __$$SendingSendingStatusCopyWithImpl<_$SendingSendingStatus>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int completedCount, int allCount) sending,
    required TResult Function() noLoading,
    required TResult Function() success,
    required TResult Function(String? message) error,
  }) {
    return sending(completedCount, allCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int completedCount, int allCount)? sending,
    TResult? Function()? noLoading,
    TResult? Function()? success,
    TResult? Function(String? message)? error,
  }) {
    return sending?.call(completedCount, allCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int completedCount, int allCount)? sending,
    TResult Function()? noLoading,
    TResult Function()? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(completedCount, allCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendingSendingStatus value) sending,
    required TResult Function(NoLoadingSendingStatus value) noLoading,
    required TResult Function(SuccessSendingStatus value) success,
    required TResult Function(ErrorSendingStatus value) error,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendingSendingStatus value)? sending,
    TResult? Function(NoLoadingSendingStatus value)? noLoading,
    TResult? Function(SuccessSendingStatus value)? success,
    TResult? Function(ErrorSendingStatus value)? error,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendingSendingStatus value)? sending,
    TResult Function(NoLoadingSendingStatus value)? noLoading,
    TResult Function(SuccessSendingStatus value)? success,
    TResult Function(ErrorSendingStatus value)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SendingSendingStatusToJson(
      this,
    );
  }
}

abstract class SendingSendingStatus implements SendingStatus {
  const factory SendingSendingStatus(
      {required final int completedCount,
      required final int allCount}) = _$SendingSendingStatus;

  factory SendingSendingStatus.fromJson(Map<String, dynamic> json) =
      _$SendingSendingStatus.fromJson;

  int get completedCount;
  int get allCount;
  @JsonKey(ignore: true)
  _$$SendingSendingStatusCopyWith<_$SendingSendingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoLoadingSendingStatusCopyWith<$Res> {
  factory _$$NoLoadingSendingStatusCopyWith(_$NoLoadingSendingStatus value,
          $Res Function(_$NoLoadingSendingStatus) then) =
      __$$NoLoadingSendingStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoLoadingSendingStatusCopyWithImpl<$Res>
    extends _$SendingStatusCopyWithImpl<$Res, _$NoLoadingSendingStatus>
    implements _$$NoLoadingSendingStatusCopyWith<$Res> {
  __$$NoLoadingSendingStatusCopyWithImpl(_$NoLoadingSendingStatus _value,
      $Res Function(_$NoLoadingSendingStatus) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NoLoadingSendingStatus implements NoLoadingSendingStatus {
  const _$NoLoadingSendingStatus({final String? $type})
      : $type = $type ?? 'noLoading';

  factory _$NoLoadingSendingStatus.fromJson(Map<String, dynamic> json) =>
      _$$NoLoadingSendingStatusFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SendingStatus.noLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoLoadingSendingStatus);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int completedCount, int allCount) sending,
    required TResult Function() noLoading,
    required TResult Function() success,
    required TResult Function(String? message) error,
  }) {
    return noLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int completedCount, int allCount)? sending,
    TResult? Function()? noLoading,
    TResult? Function()? success,
    TResult? Function(String? message)? error,
  }) {
    return noLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int completedCount, int allCount)? sending,
    TResult Function()? noLoading,
    TResult Function()? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (noLoading != null) {
      return noLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendingSendingStatus value) sending,
    required TResult Function(NoLoadingSendingStatus value) noLoading,
    required TResult Function(SuccessSendingStatus value) success,
    required TResult Function(ErrorSendingStatus value) error,
  }) {
    return noLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendingSendingStatus value)? sending,
    TResult? Function(NoLoadingSendingStatus value)? noLoading,
    TResult? Function(SuccessSendingStatus value)? success,
    TResult? Function(ErrorSendingStatus value)? error,
  }) {
    return noLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendingSendingStatus value)? sending,
    TResult Function(NoLoadingSendingStatus value)? noLoading,
    TResult Function(SuccessSendingStatus value)? success,
    TResult Function(ErrorSendingStatus value)? error,
    required TResult orElse(),
  }) {
    if (noLoading != null) {
      return noLoading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoLoadingSendingStatusToJson(
      this,
    );
  }
}

abstract class NoLoadingSendingStatus implements SendingStatus {
  const factory NoLoadingSendingStatus() = _$NoLoadingSendingStatus;

  factory NoLoadingSendingStatus.fromJson(Map<String, dynamic> json) =
      _$NoLoadingSendingStatus.fromJson;
}

/// @nodoc
abstract class _$$SuccessSendingStatusCopyWith<$Res> {
  factory _$$SuccessSendingStatusCopyWith(_$SuccessSendingStatus value,
          $Res Function(_$SuccessSendingStatus) then) =
      __$$SuccessSendingStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessSendingStatusCopyWithImpl<$Res>
    extends _$SendingStatusCopyWithImpl<$Res, _$SuccessSendingStatus>
    implements _$$SuccessSendingStatusCopyWith<$Res> {
  __$$SuccessSendingStatusCopyWithImpl(_$SuccessSendingStatus _value,
      $Res Function(_$SuccessSendingStatus) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SuccessSendingStatus implements SuccessSendingStatus {
  const _$SuccessSendingStatus({final String? $type})
      : $type = $type ?? 'success';

  factory _$SuccessSendingStatus.fromJson(Map<String, dynamic> json) =>
      _$$SuccessSendingStatusFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SendingStatus.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessSendingStatus);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int completedCount, int allCount) sending,
    required TResult Function() noLoading,
    required TResult Function() success,
    required TResult Function(String? message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int completedCount, int allCount)? sending,
    TResult? Function()? noLoading,
    TResult? Function()? success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int completedCount, int allCount)? sending,
    TResult Function()? noLoading,
    TResult Function()? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendingSendingStatus value) sending,
    required TResult Function(NoLoadingSendingStatus value) noLoading,
    required TResult Function(SuccessSendingStatus value) success,
    required TResult Function(ErrorSendingStatus value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendingSendingStatus value)? sending,
    TResult? Function(NoLoadingSendingStatus value)? noLoading,
    TResult? Function(SuccessSendingStatus value)? success,
    TResult? Function(ErrorSendingStatus value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendingSendingStatus value)? sending,
    TResult Function(NoLoadingSendingStatus value)? noLoading,
    TResult Function(SuccessSendingStatus value)? success,
    TResult Function(ErrorSendingStatus value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessSendingStatusToJson(
      this,
    );
  }
}

abstract class SuccessSendingStatus implements SendingStatus {
  const factory SuccessSendingStatus() = _$SuccessSendingStatus;

  factory SuccessSendingStatus.fromJson(Map<String, dynamic> json) =
      _$SuccessSendingStatus.fromJson;
}

/// @nodoc
abstract class _$$ErrorSendingStatusCopyWith<$Res> {
  factory _$$ErrorSendingStatusCopyWith(_$ErrorSendingStatus value,
          $Res Function(_$ErrorSendingStatus) then) =
      __$$ErrorSendingStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorSendingStatusCopyWithImpl<$Res>
    extends _$SendingStatusCopyWithImpl<$Res, _$ErrorSendingStatus>
    implements _$$ErrorSendingStatusCopyWith<$Res> {
  __$$ErrorSendingStatusCopyWithImpl(
      _$ErrorSendingStatus _value, $Res Function(_$ErrorSendingStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorSendingStatus(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorSendingStatus implements ErrorSendingStatus {
  const _$ErrorSendingStatus({required this.message, final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorSendingStatus.fromJson(Map<String, dynamic> json) =>
      _$$ErrorSendingStatusFromJson(json);

  @override
  final String? message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SendingStatus.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSendingStatus &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSendingStatusCopyWith<_$ErrorSendingStatus> get copyWith =>
      __$$ErrorSendingStatusCopyWithImpl<_$ErrorSendingStatus>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int completedCount, int allCount) sending,
    required TResult Function() noLoading,
    required TResult Function() success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int completedCount, int allCount)? sending,
    TResult? Function()? noLoading,
    TResult? Function()? success,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int completedCount, int allCount)? sending,
    TResult Function()? noLoading,
    TResult Function()? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendingSendingStatus value) sending,
    required TResult Function(NoLoadingSendingStatus value) noLoading,
    required TResult Function(SuccessSendingStatus value) success,
    required TResult Function(ErrorSendingStatus value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendingSendingStatus value)? sending,
    TResult? Function(NoLoadingSendingStatus value)? noLoading,
    TResult? Function(SuccessSendingStatus value)? success,
    TResult? Function(ErrorSendingStatus value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendingSendingStatus value)? sending,
    TResult Function(NoLoadingSendingStatus value)? noLoading,
    TResult Function(SuccessSendingStatus value)? success,
    TResult Function(ErrorSendingStatus value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorSendingStatusToJson(
      this,
    );
  }
}

abstract class ErrorSendingStatus implements SendingStatus {
  const factory ErrorSendingStatus({required final String? message}) =
      _$ErrorSendingStatus;

  factory ErrorSendingStatus.fromJson(Map<String, dynamic> json) =
      _$ErrorSendingStatus.fromJson;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorSendingStatusCopyWith<_$ErrorSendingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
