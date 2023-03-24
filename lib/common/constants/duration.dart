abstract class AnimationDuration {
  static const extraShort = Duration(milliseconds: 100);
  static const short = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 500);
  static const long = Duration(milliseconds: 750);
  static const extraLong = Duration(milliseconds: 1250);
}

abstract class AppDuration {
  static const stopTaskDelay = Duration(milliseconds: 500);
  static const buttonClickPeriod = Duration(seconds: 1);
  static const syncStartDelay = Duration(seconds: 1);
  static const syncEndDelay = Duration(seconds: 4);
}
