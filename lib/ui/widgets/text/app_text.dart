import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/common/extensions/text_theme_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? width;
  final AppTextStyle style;
  final TextOverflow? overflow;
  final bool? softWrap;
  final int? maxLines;

  const AppText({
    Key? key,
    required this.text,
    required this.style,
    this.color,
    this.textAlign,
    this.overflow = TextOverflow.fade,
    this.softWrap,
    this.width,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = style.textStyle(context.textTheme);
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        style: color == null ? textStyle : textStyle?.copyWith(color: color),
        textHeightBehavior: const TextHeightBehavior(
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}
