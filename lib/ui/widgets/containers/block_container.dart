import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/app_padding_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/page_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

final _bottomHeaderPadding = EdgeInsets.only(bottom: AppPadding.secondaryNormal.size);
final _contentPadding = EdgeInsets.all(AppPadding.secondaryNormal.size);

class BlockContainer extends StatelessWidget {
  final List<Widget> children;
  final String? header;
  final Widget? headerSuffix;

  const BlockContainer({
    super.key,
    this.header,
    this.headerSuffix,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _contentPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(Radii.normal)),
      ),
      child: PageContainer(
        isScrollable: false,
        children: [
          if (header != null) _headerWidget,
          ...children,
        ],
      ),
    );
  }

  Widget get _headerWidget => Padding(
        padding: _bottomHeaderPadding,
        child: _headerContent,
      );

  Widget get _headerContent => headerSuffix == null
      ? _headerText()
      : Row(
          children: [
            _headerText(null),
            AppPadding.tiny.expanded(),
            headerSuffix!,
          ],
        );

  Widget _headerText([double? width = double.infinity]) => AppText(
        text: header ?? '',
        style: AppTextStyle.subtitle1,
        width: width,
      );
}
