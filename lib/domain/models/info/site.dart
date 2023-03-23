import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const factory Site({
    @Default(0) int id,
    required String? series,
    required Smr? smr,
    required Snr? snr,
    required Soil? soil,
    required Preparation? preparation,
  }) = _Site;

  factory Site.create() => const Site(
        series: null,
        smr: null,
        snr: null,
        soil: null,
        preparation: null,
      );

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}
