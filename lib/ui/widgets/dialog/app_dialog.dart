import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/opacity.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  final bool blockBackButton;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    required this.blockBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !blockBackButton,
      child: AlertDialog(
        title: AppText(
          text: title,
          style: AppTextStyle.subtitle1,
        ),
        content: AppText(
          text: content,
          style: AppTextStyle.body2,
          color: context.colorScheme.onSurface.withOpacity(Opacities.dialogTextOpacity),
        ),
        actions: actions,
      ),
    );
  }
}
