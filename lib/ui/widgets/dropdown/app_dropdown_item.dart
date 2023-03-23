import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

class AppDropdownItem<T> extends StatelessWidget {
  final T item;
  final String Function(T) stringBuilder;

  const AppDropdownItem({
    super.key,
    required this.item,
    required this.stringBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: stringBuilder(item),
      style: AppTextStyle.body2,
    );
  }
}
