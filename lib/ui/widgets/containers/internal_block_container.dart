import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/opacity.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/page_container.dart';

const _borderWidth = 1.0;
final _contentPadding = EdgeInsets.all(AppPadding.large.size);

class InternalBlockContainer extends StatelessWidget {
  final List<Widget> children;

  const InternalBlockContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _contentPadding,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(Opacities.outlineBorder),
          width: _borderWidth,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(Radii.normal)),
      ),
      child: PageContainer(
        isScrollable: false,
        children: children,
      ),
    );
  }
}
