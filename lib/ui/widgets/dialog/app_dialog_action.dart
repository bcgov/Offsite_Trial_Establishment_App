import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/app_button.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/button_type.dart';

class AppDialogAction extends StatelessWidget {
  final String text;
  final Function()? action;
  final Color? color;

  const AppDialogAction({
    super.key,
    required this.text,
    this.action,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: text,
      textColor: color,
      type: ButtonType.text,
      widthType: ButtonWidthType.minimum,
      onPressed: action,
    );
  }
}
