// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Site _$SiteFromJson(Map<String, dynamic> json) {
  return _Site.fromJson(json);
}

/// @nodoc
mixin _$Site {
  int get id => throw _privateConstructorUsedError;
  String? get series => throw _privateConstructorUsedError;
  Smr? get smr => throw _privateConstructorUsedError;
  Snr? get snr => throw _privateConstructorUsedError;
  Soil? get soil => throw _privateConstructorUsedError;
  Preparation? get preparation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteCopyWith<Site> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteCopyWith<$Res> {
  factory $SiteCopyWith(Site value, $Res Function(Site) then) =
      _$SiteCopyWithImpl<$Res, Site>;
  @useResult
  $Res call(
      {int id,
      String? series,
      Smr? smr,
      Snr? snr,
      Soil? soil,
      Preparation? preparation});
}

/// @nodoc
class _$SiteCopyWithImpl<$Res, $Val extends Site>
    implements $SiteCopyWith<$Res> {
  _$SiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? series = freezed,
    Object? smr = freezed,
    Object? snr = freezed,
    Object? soil = freezed,
    Object? preparation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as String?,
      smr: freezed == smr
          ? _value.smr
          : smr // ignore: cast_nullable_to_non_nullable
              as Smr?,
      snr: freezed == snr
          ? _value.snr
          : snr // ignore: cast_nullable_to_non_nullable
              as Snr?,
      soil: freezed == soil
          ? _value.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as Soil?,
      preparation: freezed == preparation
          ? _value.preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as Preparation?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SiteCopyWith<$Res> implements $SiteCopyWith<$Res> {
  factory _$$_SiteCopyWith(_$_Site value, $Res Function(_$_Site) then) =
      __$$_SiteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? series,
      Smr? smr,
      Snr? snr,
      Soil? soil,
      Preparation? preparation});
}

/// @nodoc
class __$$_SiteCopyWithImpl<$Res> extends _$SiteCopyWithImpl<$Res, _$_Site>
    implements _$$_SiteCopyWith<$Res> {
  __$$_SiteCopyWithImpl(_$_Site _value, $Res Function(_$_Site) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? series = freezed,
    Object? smr = freezed,
    Object? snr = freezed,
    Object? soil = freezed,
    Object? preparation = freezed,
  }) {
    return _then(_$_Site(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as String?,
      smr: freezed == smr
          ? _value.smr
          : smr // ignore: cast_nullable_to_non_nullable
              as Smr?,
      snr: freezed == snr
          ? _value.snr
          : snr // ignore: cast_nullable_to_non_nullable
              as Snr?,
      soil: freezed == soil
          ? _value.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as Soil?,
      preparation: freezed == preparation
          ? _value.preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as Preparation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Site implements _Site {
  const _$_Site(
      {this.id = 0,
      required this.series,
      required this.smr,
      required this.snr,
      required this.soil,
      required this.preparation});

  factory _$_Site.fromJson(Map<String, dynamic> json) => _$$_SiteFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String? series;
  @override
  final Smr? smr;
  @override
  final Snr? snr;
  @override
  final Soil? soil;
  @override
  final Preparation? preparation;

  @override
  String toString() {
    return 'Site(id: $id, series: $series, smr: $smr, snr: $snr, soil: $soil, preparation: $preparation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Site &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.smr, smr) || other.smr == smr) &&
            (identical(other.snr, snr) || other.snr == snr) &&
            (identical(other.soil, soil) || other.soil == soil) &&
            (identical(other.preparation, preparation) ||
                other.preparation == preparation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, series, smr, snr, soil, preparation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteCopyWith<_$_Site> get copyWith =>
      __$$_SiteCopyWithImpl<_$_Site>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteToJson(
      this,
    );
  }
}

abstract class _Site implements Site {
  const factory _Site(
      {final int id,
      required final String? series,
      required final Smr? smr,
      required final Snr? snr,
      required final Soil? soil,
      required final Preparation? preparation}) = _$_Site;

  factory _Site.fromJson(Map<String, dynamic> json) = _$_Site.fromJson;

  @override
  int get id;
  @override
  String? get series;
  @override
  Smr? get smr;
  @override
  Snr? get snr;
  @override
  Soil? get soil;
  @override
  Preparation? get preparation;
  @override
  @JsonKey(ignore: true)
  _$$_SiteCopyWith<_$_Site> get copyWith => throw _privateConstructorUsedError;
}
