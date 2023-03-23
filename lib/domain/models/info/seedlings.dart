import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';

part 'seedlings.freezed.dart';
part 'seedlings.g.dart';

@freezed
class Seedlings with _$Seedlings {
  const factory Seedlings({
    required int count,
    required Species? species,
    required String seedlot,
    required double spacing,
    required String notes,
  }) = _Seedlings;

  factory Seedlings.create() => const Seedlings(
        count: -1,
        species: null,
        seedlot: '',
        spacing: -1,
        notes: '',
      );

  factory Seedlings.fromJson(Map<String, dynamic> json) => _$SeedlingsFromJson(json);
}
