// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Planting _$PlantingFromJson(Map<String, dynamic> json) {
  return _Planting.fromJson(json);
}

/// @nodoc
mixin _$Planting {
  int get internalId => throw _privateConstructorUsedError;
  String get plantingId => throw _privateConstructorUsedError;
  String get blockId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  List<String> get photoPaths => throw _privateConstructorUsedError;
  Site? get site => throw _privateConstructorUsedError;
  Seedlings? get seedlings => throw _privateConstructorUsedError;
  Trial? get trial => throw _privateConstructorUsedError;
  Planter? get planter => throw _privateConstructorUsedError;
  SyncStatus get syncStatus => throw _privateConstructorUsedError;
  DateTime get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantingCopyWith<Planting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantingCopyWith<$Res> {
  factory $PlantingCopyWith(Planting value, $Res Function(Planting) then) =
      _$PlantingCopyWithImpl<$Res, Planting>;
  @useResult
  $Res call(
      {int internalId,
      String plantingId,
      String blockId,
      DateTime date,
      Location? location,
      List<String> photoPaths,
      Site? site,
      Seedlings? seedlings,
      Trial? trial,
      Planter? planter,
      SyncStatus syncStatus,
      DateTime modifiedDate});

  $LocationCopyWith<$Res>? get location;
  $SiteCopyWith<$Res>? get site;
  $SeedlingsCopyWith<$Res>? get seedlings;
  $TrialCopyWith<$Res>? get trial;
  $PlanterCopyWith<$Res>? get planter;
}

/// @nodoc
class _$PlantingCopyWithImpl<$Res, $Val extends Planting>
    implements $PlantingCopyWith<$Res> {
  _$PlantingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? plantingId = null,
    Object? blockId = null,
    Object? date = null,
    Object? location = freezed,
    Object? photoPaths = null,
    Object? site = freezed,
    Object? seedlings = freezed,
    Object? trial = freezed,
    Object? planter = freezed,
    Object? syncStatus = null,
    Object? modifiedDate = null,
  }) {
    return _then(_value.copyWith(
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as int,
      plantingId: null == plantingId
          ? _value.plantingId
          : plantingId // ignore: cast_nullable_to_non_nullable
              as String,
      blockId: null == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      photoPaths: null == photoPaths
          ? _value.photoPaths
          : photoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as Site?,
      seedlings: freezed == seedlings
          ? _value.seedlings
          : seedlings // ignore: cast_nullable_to_non_nullable
              as Seedlings?,
      trial: freezed == trial
          ? _value.trial
          : trial // ignore: cast_nullable_to_non_nullable
              as Trial?,
      planter: freezed == planter
          ? _value.planter
          : planter // ignore: cast_nullable_to_non_nullable
              as Planter?,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SiteCopyWith<$Res>? get site {
    if (_value.site == null) {
      return null;
    }

    return $SiteCopyWith<$Res>(_value.site!, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SeedlingsCopyWith<$Res>? get seedlings {
    if (_value.seedlings == null) {
      return null;
    }

    return $SeedlingsCopyWith<$Res>(_value.seedlings!, (value) {
      return _then(_value.copyWith(seedlings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TrialCopyWith<$Res>? get trial {
    if (_value.trial == null) {
      return null;
    }

    return $TrialCopyWith<$Res>(_value.trial!, (value) {
      return _then(_value.copyWith(trial: value) as $Val);
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
abstract class _$$_PlantingCopyWith<$Res> implements $PlantingCopyWith<$Res> {
  factory _$$_PlantingCopyWith(
          _$_Planting value, $Res Function(_$_Planting) then) =
      __$$_PlantingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int internalId,
      String plantingId,
      String blockId,
      DateTime date,
      Location? location,
      List<String> photoPaths,
      Site? site,
      Seedlings? seedlings,
      Trial? trial,
      Planter? planter,
      SyncStatus syncStatus,
      DateTime modifiedDate});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $SiteCopyWith<$Res>? get site;
  @override
  $SeedlingsCopyWith<$Res>? get seedlings;
  @override
  $TrialCopyWith<$Res>? get trial;
  @override
  $PlanterCopyWith<$Res>? get planter;
}

/// @nodoc
class __$$_PlantingCopyWithImpl<$Res>
    extends _$PlantingCopyWithImpl<$Res, _$_Planting>
    implements _$$_PlantingCopyWith<$Res> {
  __$$_PlantingCopyWithImpl(
      _$_Planting _value, $Res Function(_$_Planting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? plantingId = null,
    Object? blockId = null,
    Object? date = null,
    Object? location = freezed,
    Object? photoPaths = null,
    Object? site = freezed,
    Object? seedlings = freezed,
    Object? trial = freezed,
    Object? planter = freezed,
    Object? syncStatus = null,
    Object? modifiedDate = null,
  }) {
    return _then(_$_Planting(
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as int,
      plantingId: null == plantingId
          ? _value.plantingId
          : plantingId // ignore: cast_nullable_to_non_nullable
              as String,
      blockId: null == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      photoPaths: null == photoPaths
          ? _value._photoPaths
          : photoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as Site?,
      seedlings: freezed == seedlings
          ? _value.seedlings
          : seedlings // ignore: cast_nullable_to_non_nullable
              as Seedlings?,
      trial: freezed == trial
          ? _value.trial
          : trial // ignore: cast_nullable_to_non_nullable
              as Trial?,
      planter: freezed == planter
          ? _value.planter
          : planter // ignore: cast_nullable_to_non_nullable
              as Planter?,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Planting implements _Planting {
  const _$_Planting(
      {required this.internalId,
      required this.plantingId,
      required this.blockId,
      required this.date,
      required this.location,
      required final List<String> photoPaths,
      required this.site,
      required this.seedlings,
      required this.trial,
      required this.planter,
      required this.syncStatus,
      required this.modifiedDate})
      : _photoPaths = photoPaths;

  factory _$_Planting.fromJson(Map<String, dynamic> json) =>
      _$$_PlantingFromJson(json);

  @override
  final int internalId;
  @override
  final String plantingId;
  @override
  final String blockId;
  @override
  final DateTime date;
  @override
  final Location? location;
  final List<String> _photoPaths;
  @override
  List<String> get photoPaths {
    if (_photoPaths is EqualUnmodifiableListView) return _photoPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoPaths);
  }

  @override
  final Site? site;
  @override
  final Seedlings? seedlings;
  @override
  final Trial? trial;
  @override
  final Planter? planter;
  @override
  final SyncStatus syncStatus;
  @override
  final DateTime modifiedDate;

  @override
  String toString() {
    return 'Planting(internalId: $internalId, plantingId: $plantingId, blockId: $blockId, date: $date, location: $location, photoPaths: $photoPaths, site: $site, seedlings: $seedlings, trial: $trial, planter: $planter, syncStatus: $syncStatus, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Planting &&
            (identical(other.internalId, internalId) ||
                other.internalId == internalId) &&
            (identical(other.plantingId, plantingId) ||
                other.plantingId == plantingId) &&
            (identical(other.blockId, blockId) || other.blockId == blockId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._photoPaths, _photoPaths) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.seedlings, seedlings) ||
                other.seedlings == seedlings) &&
            (identical(other.trial, trial) || other.trial == trial) &&
            (identical(other.planter, planter) || other.planter == planter) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      internalId,
      plantingId,
      blockId,
      date,
      location,
      const DeepCollectionEquality().hash(_photoPaths),
      site,
      seedlings,
      trial,
      planter,
      syncStatus,
      modifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlantingCopyWith<_$_Planting> get copyWith =>
      __$$_PlantingCopyWithImpl<_$_Planting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlantingToJson(
      this,
    );
  }
}

abstract class _Planting implements Planting {
  const factory _Planting(
      {required final int internalId,
      required final String plantingId,
      required final String blockId,
      required final DateTime date,
      required final Location? location,
      required final List<String> photoPaths,
      required final Site? site,
      required final Seedlings? seedlings,
      required final Trial? trial,
      required final Planter? planter,
      required final SyncStatus syncStatus,
      required final DateTime modifiedDate}) = _$_Planting;

  factory _Planting.fromJson(Map<String, dynamic> json) = _$_Planting.fromJson;

  @override
  int get internalId;
  @override
  String get plantingId;
  @override
  String get blockId;
  @override
  DateTime get date;
  @override
  Location? get location;
  @override
  List<String> get photoPaths;
  @override
  Site? get site;
  @override
  Seedlings? get seedlings;
  @override
  Trial? get trial;
  @override
  Planter? get planter;
  @override
  SyncStatus get syncStatus;
  @override
  DateTime get modifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_PlantingCopyWith<_$_Planting> get copyWith =>
      throw _privateConstructorUsedError;
}
