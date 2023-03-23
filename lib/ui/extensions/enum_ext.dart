import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';

extension SnrExt on Snr {
  String get text {
    switch (this) {
      case Snr.veryPoor:
        return Strings.snr.veryPoor();
      case Snr.poor:
        return Strings.snr.poor();
      case Snr.medium:
        return Strings.snr.medium();
      case Snr.rich:
        return Strings.snr.rich();
      case Snr.veryRich:
        return Strings.snr.veryRich();
    }
  }
}

extension SmrExt on Smr {
  String get text {
    switch (this) {
      case Smr.veryXeric:
        return Strings.smr.veryXeric();
      case Smr.xeric:
        return Strings.smr.xeric();
      case Smr.subxeric:
        return Strings.smr.subxeric();
      case Smr.submesic:
        return Strings.smr.submesic();
      case Smr.mesic:
        return Strings.smr.mesic();
      case Smr.subhygric:
        return Strings.smr.subhygric();
      case Smr.hygric:
        return Strings.smr.hygric();
      case Smr.subhydric:
        return Strings.smr.subhydric();
      case Smr.hydric:
        return Strings.smr.hydric();
    }
  }
}

extension SoilExt on Soil {
  String get text {
    switch (this) {
      case Soil.compactedMorainalMaterial:
        return Strings.soil.compactedMorainalMaterial();
      case Soil.stronglyCementedHorizon:
        return Strings.soil.stronglyCementedHorizon();
      case Soil.lithicContact:
        return Strings.soil.lithicContact();
      case Soil.excessiveMoisture:
        return Strings.soil.excessiveMoisture();
      case Soil.permafrost:
        return Strings.soil.permafrost();
      case Soil.fragmental:
        return Strings.soil.fragmental();
      case Soil.snowAccumulation:
        return Strings.soil.snowAccumulation();
      case Soil.wind:
        return Strings.soil.wind();
      case Soil.saltSpray:
        return Strings.soil.saltSpray();
      case Soil.frost:
        return Strings.soil.frost();
      case Soil.insolation:
        return Strings.soil.insolation();
      case Soil.coldAirDrainage:
        return Strings.soil.coldAirDrainage();
    }
  }
}

extension PreparationExt on Preparation {
  String get text {
    switch (this) {
      case Preparation.spotBurn:
        return Strings.preparation.spotBurn();
      case Preparation.mechanicalAndSpotBurn:
        return Strings.preparation.mechanicalAndSpotBurn();
      case Preparation.mMechanical:
        return Strings.preparation.mMechanical();
      case Preparation.grassSeeded:
        return Strings.preparation.grassSeeded();
      case Preparation.chemical:
        return Strings.preparation.chemical();
      case Preparation.broadcastBurn:
        return Strings.preparation.broadcastBurn();
    }
  }
}

extension SpeciesExt on Species {
  String get text {
    switch (this) {
      case Species.oa:
        return Strings.species.oa();
      case Species.fd:
        return Strings.species.fd();
      case Species.fdc:
        return Strings.species.fdc();
      case Species.fdi:
        return Strings.species.fdi();
      case Species.ba:
        return Strings.species.ba();
      case Species.bb:
        return Strings.species.bb();
      case Species.bg:
        return Strings.species.bg();
      case Species.bp:
        return Strings.species.bp();
      case Species.bm:
        return Strings.species.bm();
      case Species.bl:
        return Strings.species.bl();
      case Species.bc:
        return Strings.species.bc();
      case Species.hm:
        return Strings.species.hm();
      case Species.hw:
        return Strings.species.hw();
      case Species.ld:
        return Strings.species.ld();
      case Species.ls:
        return Strings.species.ls();
      case Species.la:
        return Strings.species.la();
      case Species.lw:
        return Strings.species.lw();
      case Species.pj:
        return Strings.species.pj();
      case Species.pf:
        return Strings.species.pf();
      case Species.pl:
        return Strings.species.pl();
      case Species.pli:
        return Strings.species.pli();
      case Species.pm:
        return Strings.species.pm();
      case Species.py:
        return Strings.species.py();
      case Species.pr:
        return Strings.species.pr();
      case Species.plc:
        return Strings.species.plc();
      case Species.ps:
        return Strings.species.ps();
      case Species.pw:
        return Strings.species.pw();
      case Species.pa:
        return Strings.species.pa();
      case Species.yp:
        return Strings.species.yp();
      case Species.cw:
        return Strings.species.cw();
      case Species.oc:
        return Strings.species.oc();
      case Species.ob:
        return Strings.species.ob();
      case Species.sb:
        return Strings.species.sb();
      case Species.se:
        return Strings.species.se();
      case Species.sn:
        return Strings.species.sn();
      case Species.ss:
        return Strings.species.ss();
      case Species.sw:
        return Strings.species.sw();
      case Species.lt:
        return Strings.species.lt();
      case Species.yc:
        return Strings.species.yc();
      case Species.tw:
        return Strings.species.tw();
      case Species.dr:
        return Strings.species.dr();
      case Species.ra:
        return Strings.species.ra();
      case Species.og:
        return Strings.species.og();
      case Species.oh:
        return Strings.species.oh();
      case Species.at:
        return Strings.species.at();
      case Species.ep:
        return Strings.species.ep();
      case Species.ac:
        return Strings.species.ac();
      case Species.ad:
        return Strings.species.ad();
      case Species.oi:
        return Strings.species.oi();
      case Species.mb:
        return Strings.species.mb();
      case Species.qg:
        return Strings.species.qg();
      case Species.qw:
        return Strings.species.qw();
    }
  }
}
