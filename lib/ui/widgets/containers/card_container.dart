import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/app_padding_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';

final _defaultPadding = EdgeInsets.all(AppPadding.extraSmall.size);

class CardContainer extends StatelessWidget {
  final Widget center;
  final Widget bottom;
  final Color? color;
  final EdgeInsets? padding;

  const CardContainer({
    super.key,
    required this.center,
    required this.bottom,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? _defaultPadding,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(Radii.normal)),
        ),
        child: Column(
          children: [
            AppPadding.small.expanded(),
            center,
            AppPadding.small.expanded(),
            bottom,
            AppPadding.large.spacer,
          ],
        ),
      ),
    );
  }
}
