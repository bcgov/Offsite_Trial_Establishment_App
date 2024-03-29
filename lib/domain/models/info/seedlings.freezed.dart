// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seedlings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Seedlings _$SeedlingsFromJson(Map<String, dynamic> json) {
  return _Seedlings.fromJson(json);
}

/// @nodoc
mixin _$Seedlings {
  int get count => throw _privateConstructorUsedError;
  Species? get species => throw _privateConstructorUsedError;
  String get seedlot => throw _privateConstructorUsedError;
  double get spacing => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeedlingsCopyWith<Seedlings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedlingsCopyWith<$Res> {
  factory $SeedlingsCopyWith(Seedlings value, $Res Function(Seedlings) then) =
      _$SeedlingsCopyWithImpl<$Res, Seedlings>;
  @useResult
  $Res call(
      {int count,
      Species? species,
      String seedlot,
      double spacing,
      String notes});
}

/// @nodoc
class _$SeedlingsCopyWithImpl<$Res, $Val extends Seedlings>
    implements $SeedlingsCopyWith<$Res> {
  _$SeedlingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? species = freezed,
    Object? seedlot = null,
    Object? spacing = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species?,
      seedlot: null == seedlot
          ? _value.seedlot
          : seedlot // ignore: cast_nullable_to_non_nullable
              as String,
      spacing: null == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeedlingsCopyWith<$Res> implements $SeedlingsCopyWith<$Res> {
  factory _$$_SeedlingsCopyWith(
          _$_Seedlings value, $Res Function(_$_Seedlings) then) =
      __$$_SeedlingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      Species? species,
      String seedlot,
      double spacing,
      String notes});
}

/// @nodoc
class __$$_SeedlingsCopyWithImpl<$Res>
    extends _$SeedlingsCopyWithImpl<$Res, _$_Seedlings>
    implements _$$_SeedlingsCopyWith<$Res> {
  __$$_SeedlingsCopyWithImpl(
      _$_Seedlings _value, $Res Function(_$_Seedlings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? species = freezed,
    Object? seedlot = null,
    Object? spacing = null,
    Object? notes = null,
  }) {
    return _then(_$_Seedlings(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species?,
      seedlot: null == seedlot
          ? _value.seedlot
          : seedlot // ignore: cast_nullable_to_non_nullable
              as String,
      spacing: null == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Seedlings implements _Seedlings {
  const _$_Seedlings(
      {required this.count,
      required this.species,
      required this.seedlot,
      required this.spacing,
      required this.notes});

  factory _$_Seedlings.fromJson(Map<String, dynamic> json) =>
      _$$_SeedlingsFromJson(json);

  @override
  final int count;
  @override
  final Species? species;
  @override
  final String seedlot;
  @override
  final double spacing;
  @override
  final String notes;

  @override
  String toString() {
    return 'Seedlings(count: $count, species: $species, seedlot: $seedlot, spacing: $spacing, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Seedlings &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.seedlot, seedlot) || other.seedlot == seedlot) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, count, species, seedlot, spacing, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeedlingsCopyWith<_$_Seedlings> get copyWith =>
      __$$_SeedlingsCopyWithImpl<_$_Seedlings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeedlingsToJson(
      this,
    );
  }
}

abstract class _Seedlings implements Seedlings {
  const factory _Seedlings(
      {required final int count,
      required final Species? species,
      required final String seedlot,
      required final double spacing,
      required final String notes}) = _$_Seedlings;

  factory _Seedlings.fromJson(Map<String, dynamic> json) =
      _$_Seedlings.fromJson;

  @override
  int get count;
  @override
  Species? get species;
  @override
  String get seedlot;
  @override
  double get spacing;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$_SeedlingsCopyWith<_$_Seedlings> get copyWith =>
      throw _privateConstructorUsedError;
}
