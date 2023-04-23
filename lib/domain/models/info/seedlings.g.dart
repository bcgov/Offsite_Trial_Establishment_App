// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seedlings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Seedlings _$$_SeedlingsFromJson(Map<String, dynamic> json) => _$_Seedlings(
      count: json['count'] as int,
      species: $enumDecodeNullable(_$SpeciesEnumMap, json['species']),
      seedlot: json['seedlot'] as String,
      spacing: (json['spacing'] as num).toDouble(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$_SeedlingsToJson(_$_Seedlings instance) =>
    <String, dynamic>{
      'count': instance.count,
      'species': _$SpeciesEnumMap[instance.species],
      'seedlot': instance.seedlot,
      'spacing': instance.spacing,
      'notes': instance.notes,
    };

const _$SpeciesEnumMap = {
  Species.oa: 'oa',
  Species.fd: 'fd',
  Species.fdc: 'fdc',
  Species.fdi: 'fdi',
  Species.ba: 'ba',
  Species.bb: 'bb',
  Species.bg: 'bg',
  Species.bp: 'bp',
  Species.bm: 'bm',
  Species.bl: 'bl',
  Species.bc: 'bc',
  Species.hm: 'hm',
  Species.hw: 'hw',
  Species.ld: 'ld',
  Species.ls: 'ls',
  Species.la: 'la',
  Species.lw: 'lw',
  Species.pj: 'pj',
  Species.pf: 'pf',
  Species.pl: 'pl',
  Species.pli: 'pli',
  Species.pm: 'pm',
  Species.py: 'py',
  Species.pr: 'pr',
  Species.plc: 'plc',
  Species.ps: 'ps',
  Species.pw: 'pw',
  Species.pa: 'pa',
  Species.yp: 'yp',
  Species.cw: 'cw',
  Species.oc: 'oc',
  Species.ob: 'ob',
  Species.sb: 'sb',
  Species.se: 'se',
  Species.sn: 'sn',
  Species.ss: 'ss',
  Species.sw: 'sw',
  Species.lt: 'lt',
  Species.yc: 'yc',
  Species.tw: 'tw',
  Species.dr: 'dr',
  Species.ra: 'ra',
  Species.og: 'og',
  Species.oh: 'oh',
  Species.at: 'at',
  Species.ep: 'ep',
  Species.ac: 'ac',
  Species.ad: 'ad',
  Species.oi: 'oi',
  Species.mb: 'mb',
  Species.qg: 'qg',
  Species.qw: 'qw',
};
