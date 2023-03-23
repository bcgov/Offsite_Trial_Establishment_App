extension DateTimeExt on DateTime {
  DateTime addYears([int count = 1]) => DateTime(
        year + count,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
}
