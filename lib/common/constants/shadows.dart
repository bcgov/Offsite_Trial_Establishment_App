import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Shadows {
  static elevation0({
    Color color = AppColors.zeroShadowColor,
  }) =>
      [
        BoxShadow(
          color: color,
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ];

  static elevation1({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 1,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 1,
          offset: const Offset(0, 1),
        ),
      ];

  static elevation2({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 5,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 1,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ];

  static elevation3({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 8,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ];

  static elevation4({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 10,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ];

  static elevation6({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 18,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 10,
          offset: const Offset(0, 6),
        ),
      ];

  static elevation8({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 14,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 10,
          offset: const Offset(0, 8),
        ),
      ];

  static elevation9({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 6,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 16,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 12,
          offset: const Offset(0, 9),
        ),
      ];

  static elevation12({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 8,
          offset: const Offset(0, 7),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 22,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 17,
          offset: const Offset(0, 12),
        ),
      ];

  static elevation16({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 10,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 30,
          offset: const Offset(0, 6),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 24,
          offset: const Offset(0, 16),
        ),
      ];

  static elevation24({
    Color firstColor = AppColors.shadowColor,
    Color secondColor = AppColors.secondShadowColor,
    Color thirdColor = AppColors.thirdShadowColor,
  }) =>
      [
        BoxShadow(
          color: firstColor,
          blurRadius: 15,
          offset: const Offset(0, 11),
        ),
        BoxShadow(
          color: secondColor,
          blurRadius: 46,
          offset: const Offset(0, 9),
        ),
        BoxShadow(
          color: thirdColor,
          blurRadius: 38,
          offset: const Offset(0, 24),
        ),
      ];
}
