import 'package:offsite_trial_establishment_app/common/extensions/date_time_ext.dart';

abstract class AppDate {
  static final minPickerDate = DateTime(2000);
  static final maxPickerDate = DateTime.now().addYears();
}
