import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTypography {
  static const _fontFamily = 'Roboto';
  static final light = TextTheme(
    headline1: TextStyle(
      fontSize: 96.sp,
      height: 1.16,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5.w,
      fontFamily: _fontFamily,
    ),
    headline2: TextStyle(
      fontSize: 60.sp,
      height: 1.2,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5.w,
      fontFamily: _fontFamily,
    ),
    headline3: TextStyle(
      fontSize: 48.sp,
      height: 1.16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.02.w,
      fontFamily: _fontFamily,
    ),
    headline4: TextStyle(
      fontSize: 34.sp,
      height: 1.06,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    headline5: TextStyle(
      fontSize: 24.sp,
      height: 1,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18.w,
      fontFamily: _fontFamily,
    ),
    headline6: TextStyle(
      fontSize: 20.sp,
      height: 1.2,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.w,
      fontFamily: _fontFamily,
    ),
    subtitle1: TextStyle(
      fontSize: 16.sp,
      height: 1.5,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.w,
      fontFamily: _fontFamily,
    ),
    subtitle2: TextStyle(
      fontSize: 14.sp,
      height: 1.71,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1.w,
      fontFamily: _fontFamily,
    ),
    bodyText1: TextStyle(
      fontSize: 16.sp,
      height: 1.5,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5.w,
      fontFamily: _fontFamily,
    ),
    bodyText2: TextStyle(
      fontSize: 14.sp,
      height: 1.42,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25.w,
      fontFamily: _fontFamily,
    ),
    button: TextStyle(
      fontSize: 16.sp,
      height: 1.5,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.w,
      fontFamily: _fontFamily,
    ),
    caption: TextStyle(
      fontSize: 12.sp,
      height: 1.33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4.w,
      fontFamily: _fontFamily,
    ),
    overline: TextStyle(
      fontSize: 10.sp,
      height: 1.6,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5.w,
      fontFamily: _fontFamily,
    ),
  );
}

enum AppTextStyle {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overline,
}
