import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/duration.dart';
import 'package:offsite_trial_establishment_app/common/constants/opacity.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/common/extensions/text_theme_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/text_style_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

const _borderWidth = 2.0;
final _contentPadding = EdgeInsets.symmetric(
  vertical: AppPadding.extraSmall.size,
  horizontal: AppPadding.normal.size,
);
final _bottomTextPadding = EdgeInsets.only(
  top: AppPadding.tiny.size,
);

mixin AppTextFieldStyle<T extends StatefulWidget> on State<T> {
  bool get hideBottomText;

  String? get error;

  TextStyle? get textStyle => AppTextStyle.body1.textStyle(context.textTheme);
  final _errorKey = GlobalKey();
  final _helperKey = GlobalKey();
  final _sizedBoxKey = GlobalKey();

  InputDecoration getInputDecoration(String? hintText, Widget? suffix) {
    const borderRadius = BorderRadius.all(
      Radius.circular(Radii.tiny),
    );

    final labelTextStyle = AppTextStyle.caption.textStyle(context.textTheme);
    final labelStyle = labelTextStyle?.copyWithOpacity(Opacities.labelOpacity);
    final surfaceColor = context.colorScheme.surface;
    final errorColor = context.colorScheme.error;
    final defaultBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: context.colorScheme.primary,
        width: _borderWidth,
      ),
    );
    const enabledBorder = UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: Colors.transparent,
        width: _borderWidth,
      ),
    );
    final errorBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: errorColor,
        width: _borderWidth,
      ),
    );
    return InputDecoration(
      filled: true,
      border: defaultBorder,
      enabledBorder: enabledBorder,
      errorBorder: errorBorder,
      labelText: hintText,
      labelStyle: textStyle?.copyWithOpacity(Opacities.labelOpacity),
      floatingLabelStyle: labelStyle,
      contentPadding: _contentPadding,
      errorText: error != null ? '' : null,
      // for 0 height
      errorStyle: const TextStyle(fontSize: 0),
      fillColor: surfaceColor,
      suffixIcon: suffix,
    );
  }

  Widget wrapper({required Widget child, String? helperText}) {
    return Column(
      children: [
        child,
        _bottomText(helperText),
      ],
    );
  }

  Widget _bottomText(String? helperText) {
    final Widget child;
    if (error != null) {
      child = Padding(
        key: _errorKey,
        padding: _bottomTextPadding,
        child: AppText(
          text: error!,
          style: AppTextStyle.caption,
          color: context.colorScheme.error,
          width: double.infinity,
        ),
      );
    } else if (hideBottomText) {
      child = SizedBox(
        key: _sizedBoxKey,
      );
    } else {
      child = Padding(
        key: _helperKey,
        padding: _bottomTextPadding,
        child: AppText(
          text: helperText ?? ' ',
          style: AppTextStyle.caption,
          width: double.infinity,
        ),
      );
    }
    return AnimatedSwitcher(
      duration: AnimationDuration.extraShort,
      child: child,
      transitionBuilder: (widget, animation) => FadeTransition(
        opacity: animation,
        child: widget,
      ),
    );
  }
}
