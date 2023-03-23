import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/duration.dart';
import 'package:offsite_trial_establishment_app/common/constants/opacity.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/common/constants/sizes.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/common/utils/keyboard_utils.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/button_type.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

const _elevation = 0.0;

class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? textColor;
  final String? leadingImage;
  final ButtonWidthType widthType;
  final ButtonType type;
  final String? validationKey;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.leadingImage,
    this.widthType = ButtonWidthType.maximum,
    this.type = ButtonType.primary,
    this.validationKey,
  });

  @override
  State<StatefulWidget> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with ErrorState {
  String? _error;

  DateTime lastPress = DateTime.fromMicrosecondsSinceEpoch(0);

  bool get isCorrectClick => DateTime.now().difference(lastPress.add(AppDuration.buttonClickPeriod)) > Duration.zero;

  Color get defaultColor {
    switch (widget.type) {
      case ButtonType.primary:
        return widget.onPressed != null
            ? context.colorScheme.onPrimary
            : context.colorScheme.onPrimary.withOpacity(Opacities.percentage42);
      case ButtonType.outline:
        return widget.onPressed != null
            ? context.colorScheme.primary
            : context.colorScheme.primary.withOpacity(Opacities.percentage42);
      case ButtonType.text:
        return widget.onPressed != null
            ? context.colorScheme.primary
            : context.colorScheme.primary.withOpacity(Opacities.percentage42);
    }
  }

  EdgeInsets get contentPadding {
    switch (widget.widthType) {
      case ButtonWidthType.maximum:
        return EdgeInsets.zero;
      case ButtonWidthType.minimum:
        return EdgeInsets.symmetric(
          horizontal: AppPadding.large.size,
          vertical: AppPadding.normal.size,
        );
    }
  }

  @override
  String? validationKeyOf(covariant AppButton widget) => widget.validationKey;

  @override
  void showError(String error) {
    setState(() {
      _error = error;
    });
  }

  @override
  Widget buildContent(BuildContext context) {
    Widget button;
    switch (widget.type) {
      case ButtonType.primary:
        button = primaryButton();
        break;
      case ButtonType.outline:
        button = outlineButton();
        break;
      case ButtonType.text:
        button = textButton();
        break;
    }
    if (_error == null) return button;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        button,
        AppText(
          text: _error ?? '',
          style: AppTextStyle.caption,
          color: context.colorScheme.error,
        ),
      ],
    );
  }

  Widget content([Color? color]) {
    if (widget.leadingImage == null) {
      return Padding(
        padding: contentPadding,
        child: text(color),
      );
    }
    return Padding(
      padding: contentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadingImage(color),
          text(color),
        ],
      ),
    );
  }

  Widget leadingImage([Color? color]) => AssetsImage(
        path: widget.leadingImage,
        color: color ?? widget.textColor ?? defaultColor,
      );

  Widget text([Color? color]) => AppText(
        text: widget.text,
        style: AppTextStyle.button,
        color: color ?? widget.textColor ?? defaultColor,
      );

  Widget primaryButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _error == null ? context.colorScheme.primaryContainer : context.colorScheme.error,
        foregroundColor: context.colorScheme.onPrimary,
        minimumSize: Size(widget.widthType.minimumWidth, Sizes.minButtonHeight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.normal)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: _elevation,
      ),
      onPressed: onPressed(),
      child: content(),
    );
  }

  Widget outlineButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: context.colorScheme.onPrimary,
        minimumSize: Size(widget.widthType.minimumWidth, Sizes.minButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.normal),
        ),
        side: BorderSide(
          width: Sizes.smallBorderWidth,
          color: _error == null
              ? context.colorScheme.onSurface.withOpacity(Opacities.outlineBorder)
              : context.colorScheme.error,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: _elevation,
      ),
      onPressed: onPressed(),
      child: content(_error == null ? null : context.colorScheme.error),
    );
  }

  Widget textButton() {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: context.colorScheme.onPrimary,
        minimumSize: Size(widget.widthType.minimumWidth, Sizes.minButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.normal),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: _elevation,
      ),
      onPressed: onPressed(),
      child: content(_error == null ? null : context.colorScheme.error),
    );
  }

  VoidCallback? onPressed() {
    if (widget.onPressed == null) return null;
    return onClick;
  }

  void onClick() {
    if (isCorrectClick) {
      KeyboardUtils.hide();
      lastPress = DateTime.now();
      widget.onPressed?.call();
    }
    if (_error != null) {
      setState(() {
        _error = null;
      });
    }
  }
}
