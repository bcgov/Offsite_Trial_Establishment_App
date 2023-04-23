// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Site _$$_SiteFromJson(Map<String, dynamic> json) => _$_Site(
      id: json['id'] as int? ?? 0,
      series: json['series'] as String?,
      smr: $enumDecodeNullable(_$SmrEnumMap, json['smr']),
      snr: $enumDecodeNullable(_$SnrEnumMap, json['snr']),
      soil: $enumDecodeNullable(_$SoilEnumMap, json['soil']),
      preparation:
          $enumDecodeNullable(_$PreparationEnumMap, json['preparation']),
    );

Map<String, dynamic> _$$_SiteToJson(_$_Site instance) => <String, dynamic>{
      'id': instance.id,
      'series': instance.series,
      'smr': _$SmrEnumMap[instance.smr],
      'snr': _$SnrEnumMap[instance.snr],
      'soil': _$SoilEnumMap[instance.soil],
      'preparation': _$PreparationEnumMap[instance.preparation],
    };

const _$SmrEnumMap = {
  Smr.veryXeric: 'veryXeric',
  Smr.xeric: 'xeric',
  Smr.subxeric: 'subxeric',
  Smr.submesic: 'submesic',
  Smr.mesic: 'mesic',
  Smr.subhygric: 'subhygric',
  Smr.hygric: 'hygric',
  Smr.subhydric: 'subhydric',
  Smr.hydric: 'hydric',
};

const _$SnrEnumMap = {
  Snr.veryPoor: 'veryPoor',
  Snr.poor: 'poor',
  Snr.medium: 'medium',
  Snr.rich: 'rich',
  Snr.veryRich: 'veryRich',
};

const _$SoilEnumMap = {
  Soil.compactedMorainalMaterial: 'compactedMorainalMaterial',
  Soil.stronglyCementedHorizon: 'stronglyCementedHorizon',
  Soil.lithicContact: 'lithicContact',
  Soil.excessiveMoisture: 'excessiveMoisture',
  Soil.permafrost: 'permafrost',
  Soil.fragmental: 'fragmental',
  Soil.snowAccumulation: 'snowAccumulation',
  Soil.wind: 'wind',
  Soil.saltSpray: 'saltSpray',
  Soil.frost: 'frost',
  Soil.insolation: 'insolation',
  Soil.coldAirDrainage: 'coldAirDrainage',
};

const _$PreparationEnumMap = {
  Preparation.spotBurn: 'spotBurn',
  Preparation.mechanicalAndSpotBurn: 'mechanicalAndSpotBurn',
  Preparation.mMechanical: 'mMechanical',
  Preparation.grassSeeded: 'grassSeeded',
  Preparation.chemical: 'chemical',
  Preparation.broadcastBurn: 'broadcastBurn',
};
