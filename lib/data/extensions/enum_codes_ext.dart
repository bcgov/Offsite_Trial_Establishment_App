import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';

extension SmrCodeExt on Smr {
  String get code {
    switch (this) {
      case Smr.veryXeric:
        return '0';
      case Smr.xeric:
        return '1';
      case Smr.subxeric:
        return '2';
      case Smr.submesic:
        return '3';
      case Smr.mesic:
        return '4';
      case Smr.subhygric:
        return '5';
      case Smr.hygric:
        return '6';
      case Smr.subhydric:
        return '7';
      case Smr.hydric:
        return '8';
    }
  }
}

extension SnrCodeExt on Snr {
  String get code {
    switch (this) {
      case Snr.veryPoor:
        return 'A';
      case Snr.poor:
        return 'B';
      case Snr.medium:
        return 'C';
      case Snr.rich:
        return 'D';
      case Snr.veryRich:
        return 'E';
    }
  }
}

extension SoilCodeExt on Soil {
  String get code {
    switch (this) {
      case Soil.compactedMorainalMaterial:
        return 'K';
      case Soil.stronglyCementedHorizon:
        return 'C';
      case Soil.lithicContact:
        return 'L';
      case Soil.excessiveMoisture:
        return 'W';
      case Soil.permafrost:
        return 'Z';
      case Soil.fragmental:
        return 'F';
      case Soil.snowAccumulation:
        return 'SN';
      case Soil.wind:
        return 'WI';
      case Soil.saltSpray:
        return 'SA';
      case Soil.frost:
        return 'FR';
      case Soil.insolation:
        return 'IN';
      case Soil.coldAirDrainage:
        return 'CA';
    }
  }
}

extension PreparationCodeExt on Preparation {
  String get code {
    switch (this) {
      case Preparation.spotBurn:
        return 'PS';
      case Preparation.mechanicalAndSpotBurn:
        return 'PMS';
      case Preparation.mMechanical:
        return 'PM';
      case Preparation.grassSeeded:
        return 'PG';
      case Preparation.chemical:
        return 'PC';
      case Preparation.broadcastBurn:
        return 'PB';
    }
  }
}

extension SpeciesCodeExt on Species {
  String get code {
    switch (this) {
      case Species.oa:
        return 'Oa';
      case Species.fd:
        return 'Fd';
      case Species.fdc:
        return 'Fdc';
      case Species.fdi:
        return 'Fdi';
      case Species.ba:
        return 'Ba';
      case Species.bb:
        return 'Bb';
      case Species.bg:
        return 'Bg';
      case Species.bp:
        return 'Bp';
      case Species.bm:
        return 'Bm';
      case Species.bl:
        return 'Bl';
      case Species.bc:
        return 'Bc';
      case Species.hm:
        return 'Hm';
      case Species.hw:
        return 'Hw';
      case Species.ld:
        return 'Ld';
      case Species.ls:
        return 'Ls';
      case Species.la:
        return 'La';
      case Species.lw:
        return 'Lw';
      case Species.pj:
        return 'Pj';
      case Species.pf:
        return 'Pf';
      case Species.pl:
        return 'Pl';
      case Species.pli:
        return 'Pli';
      case Species.pm:
        return 'Pm';
      case Species.py:
        return 'Py';
      case Species.pr:
        return 'Pr';
      case Species.plc:
        return 'Plc';
      case Species.ps:
        return 'Ps';
      case Species.pw:
        return 'Pw';
      case Species.pa:
        return 'Pa';
      case Species.yp:
        return 'Yp';
      case Species.cw:
        return 'Cw';
      case Species.oc:
        return 'Oc';
      case Species.ob:
        return 'Ob';
      case Species.sb:
        return 'Sb';
      case Species.se:
        return 'Se';
      case Species.sn:
        return 'Sn';
      case Species.ss:
        return 'Ss';
      case Species.sw:
        return 'Sw';
      case Species.lt:
        return 'Lt';
      case Species.yc:
        return 'Yc';
      case Species.tw:
        return 'Tw';
      case Species.dr:
        return 'Dr';
      case Species.ra:
        return 'Ra';
      case Species.og:
        return 'Og';
      case Species.oh:
        return 'Oh';
      case Species.at:
        return 'At';
      case Species.ep:
        return 'Ep';
      case Species.ac:
        return 'Ac';
      case Species.ad:
        return 'Ad';
      case Species.oi:
        return 'Oi';
      case Species.mb:
        return 'Mb';
      case Species.qg:
        return 'Qg';
      case Species.qw:
        return 'Qw';
    }
  }
}
