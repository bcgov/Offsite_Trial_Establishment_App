import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/colors.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';

abstract class AppTheme {
  static final light = ThemeData.from(
    colorScheme: AppColors.light,
    textTheme: AppTypography.light,
  );
}
