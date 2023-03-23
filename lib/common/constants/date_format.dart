import 'package:intl/intl.dart';

abstract class DateFormats {
  static final date = DateFormat("dd MMMM yyyy");
  static final dateAndTime = DateFormat("MMM dd, hh:mm aa");
}
