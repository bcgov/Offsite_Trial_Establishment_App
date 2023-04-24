// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Dialog {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)
        datePicker,
    required TResult Function(dynamic Function() onLogout) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult? Function(dynamic Function() onLogout)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult Function(dynamic Function() onLogout)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) error,
    required TResult Function(DatePickerDialog value) datePicker,
    required TResult Function(Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(DatePickerDialog value)? datePicker,
    TResult? Function(Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? error,
    TResult Function(DatePickerDialog value)? datePicker,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogCopyWith<$Res> {
  factory $DialogCopyWith(Dialog value, $Res Function(Dialog) then) =
      _$DialogCopyWithImpl<$Res, Dialog>;
}

/// @nodoc
class _$DialogCopyWithImpl<$Res, $Val extends Dialog>
    implements $DialogCopyWith<$Res> {
  _$DialogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorDetailsCopyWith<$Res> {
  factory _$$ErrorDetailsCopyWith(
          _$ErrorDetails value, $Res Function(_$ErrorDetails) then) =
      __$$ErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorDetailsCopyWithImpl<$Res>
    extends _$DialogCopyWithImpl<$Res, _$ErrorDetails>
    implements _$$ErrorDetailsCopyWith<$Res> {
  __$$ErrorDetailsCopyWithImpl(
      _$ErrorDetails _value, $Res Function(_$ErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorDetails implements ErrorDetails {
  const _$ErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Dialog.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailsCopyWith<_$ErrorDetails> get copyWith =>
      __$$ErrorDetailsCopyWithImpl<_$ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)
        datePicker,
    required TResult Function(dynamic Function() onLogout) logout,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult? Function(dynamic Function() onLogout)? logout,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult Function(dynamic Function() onLogout)? logout,
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
    required TResult Function(ErrorDetails value) error,
    required TResult Function(DatePickerDialog value) datePicker,
    required TResult Function(Logout value) logout,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(DatePickerDialog value)? datePicker,
    TResult? Function(Logout value)? logout,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? error,
    TResult Function(DatePickerDialog value)? datePicker,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements Dialog {
  const factory ErrorDetails([final String? message]) = _$ErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorDetailsCopyWith<_$ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DatePickerDialogCopyWith<$Res> {
  factory _$$DatePickerDialogCopyWith(
          _$DatePickerDialog value, $Res Function(_$DatePickerDialog) then) =
      __$$DatePickerDialogCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime initialDate, dynamic Function(DateTime) onSelected});
}

/// @nodoc
class __$$DatePickerDialogCopyWithImpl<$Res>
    extends _$DialogCopyWithImpl<$Res, _$DatePickerDialog>
    implements _$$DatePickerDialogCopyWith<$Res> {
  __$$DatePickerDialogCopyWithImpl(
      _$DatePickerDialog _value, $Res Function(_$DatePickerDialog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialDate = null,
    Object? onSelected = null,
  }) {
    return _then(_$DatePickerDialog(
      initialDate: null == initialDate
          ? _value.initialDate
          : initialDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      onSelected: null == onSelected
          ? _value.onSelected
          : onSelected // ignore: cast_nullable_to_non_nullable
              as dynamic Function(DateTime),
    ));
  }
}

/// @nodoc

class _$DatePickerDialog implements DatePickerDialog {
  const _$DatePickerDialog(
      {required this.initialDate, required this.onSelected});

  @override
  final DateTime initialDate;
  @override
  final dynamic Function(DateTime) onSelected;

  @override
  String toString() {
    return 'Dialog.datePicker(initialDate: $initialDate, onSelected: $onSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatePickerDialog &&
            (identical(other.initialDate, initialDate) ||
                other.initialDate == initialDate) &&
            (identical(other.onSelected, onSelected) ||
                other.onSelected == onSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialDate, onSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatePickerDialogCopyWith<_$DatePickerDialog> get copyWith =>
      __$$DatePickerDialogCopyWithImpl<_$DatePickerDialog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)
        datePicker,
    required TResult Function(dynamic Function() onLogout) logout,
  }) {
    return datePicker(initialDate, onSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult? Function(dynamic Function() onLogout)? logout,
  }) {
    return datePicker?.call(initialDate, onSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult Function(dynamic Function() onLogout)? logout,
    required TResult orElse(),
  }) {
    if (datePicker != null) {
      return datePicker(initialDate, onSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) error,
    required TResult Function(DatePickerDialog value) datePicker,
    required TResult Function(Logout value) logout,
  }) {
    return datePicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(DatePickerDialog value)? datePicker,
    TResult? Function(Logout value)? logout,
  }) {
    return datePicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? error,
    TResult Function(DatePickerDialog value)? datePicker,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (datePicker != null) {
      return datePicker(this);
    }
    return orElse();
  }
}

abstract class DatePickerDialog implements Dialog {
  const factory DatePickerDialog(
          {required final DateTime initialDate,
          required final dynamic Function(DateTime) onSelected}) =
      _$DatePickerDialog;

  DateTime get initialDate;
  dynamic Function(DateTime) get onSelected;
  @JsonKey(ignore: true)
  _$$DatePickerDialogCopyWith<_$DatePickerDialog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutCopyWith<$Res> {
  factory _$$LogoutCopyWith(_$Logout value, $Res Function(_$Logout) then) =
      __$$LogoutCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic Function() onLogout});
}

/// @nodoc
class __$$LogoutCopyWithImpl<$Res> extends _$DialogCopyWithImpl<$Res, _$Logout>
    implements _$$LogoutCopyWith<$Res> {
  __$$LogoutCopyWithImpl(_$Logout _value, $Res Function(_$Logout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onLogout = null,
  }) {
    return _then(_$Logout(
      onLogout: null == onLogout
          ? _value.onLogout
          : onLogout // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
    ));
  }
}

/// @nodoc

class _$Logout implements Logout {
  const _$Logout({required this.onLogout});

  @override
  final dynamic Function() onLogout;

  @override
  String toString() {
    return 'Dialog.logout(onLogout: $onLogout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Logout &&
            (identical(other.onLogout, onLogout) ||
                other.onLogout == onLogout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onLogout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutCopyWith<_$Logout> get copyWith =>
      __$$LogoutCopyWithImpl<_$Logout>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) error,
    required TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)
        datePicker,
    required TResult Function(dynamic Function() onLogout) logout,
  }) {
    return logout(onLogout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? error,
    TResult? Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult? Function(dynamic Function() onLogout)? logout,
  }) {
    return logout?.call(onLogout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? error,
    TResult Function(
            DateTime initialDate, dynamic Function(DateTime) onSelected)?
        datePicker,
    TResult Function(dynamic Function() onLogout)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(onLogout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) error,
    required TResult Function(DatePickerDialog value) datePicker,
    required TResult Function(Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(DatePickerDialog value)? datePicker,
    TResult? Function(Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? error,
    TResult Function(DatePickerDialog value)? datePicker,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout implements Dialog {
  const factory Logout({required final dynamic Function() onLogout}) = _$Logout;

  dynamic Function() get onLogout;
  @JsonKey(ignore: true)
  _$$LogoutCopyWith<_$Logout> get copyWith =>
      throw _privateConstructorUsedError;
}
