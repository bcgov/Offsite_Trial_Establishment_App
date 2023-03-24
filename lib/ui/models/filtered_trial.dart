import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/autocomplete_text_field.dart';

class FilteredTrial extends FilteredObject {
  final Trial? value;

  FilteredTrial(this.value);

  static FilteredTrial? create(Trial? value) => value != null ? FilteredTrial(value) : null;

  @override
  bool contains(String text) {
    return value?.nickname.toLowerCase().contains(text.toLowerCase()) == true;
  }

  @override
  String toString() {
    return value?.nickname ?? '';
  }
}
