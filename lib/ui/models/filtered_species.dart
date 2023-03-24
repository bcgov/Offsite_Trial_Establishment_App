import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/enum_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/autocomplete_text_field.dart';

class FilteredSpecies extends FilteredObject {
  final Species value;

  FilteredSpecies(
    this.value,
  );

  static FilteredSpecies? create(Species? value) => value != null ? FilteredSpecies(value) : null;

  @override
  bool contains(String text) {
    return toString().toLowerCase().contains(text.toLowerCase());
  }

  @override
  String toString() {
    return value.text;
  }
}
