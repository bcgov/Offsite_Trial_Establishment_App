import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';

extension AppTextStyleBuilder on AppTextStyle {
  TextStyle? textStyle(TextTheme theme) {
    switch (this) {
      case AppTextStyle.headline1:
        return theme.headline1;
      case AppTextStyle.headline2:
        return theme.headline2;
      case AppTextStyle.headline3:
        return theme.headline3;
      case AppTextStyle.headline4:
        return theme.headline4;
      case AppTextStyle.headline5:
        return theme.headline5;
      case AppTextStyle.headline6:
        return theme.headline6;
      case AppTextStyle.subtitle1:
        return theme.subtitle1;
      case AppTextStyle.subtitle2:
        return theme.subtitle2;
      case AppTextStyle.body1:
        return theme.bodyText1;
      case AppTextStyle.body2:
        return theme.bodyText2;
      case AppTextStyle.button:
        return theme.button;
      case AppTextStyle.caption:
        return theme.caption;
      case AppTextStyle.overline:
        return theme.overline;
    }
  }
}
