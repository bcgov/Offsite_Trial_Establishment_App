import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/duration.dart';
import 'package:offsite_trial_establishment_app/common/constants/image_assets.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/common/constants/rotation.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/app_padding_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/page_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/size_animation_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

final _childrenPadding = EdgeInsets.only(top: AppPadding.large.size);
final _contentPadding = EdgeInsets.all(AppPadding.secondaryNormal.size);

class CollapsingBlockContainer extends StatefulWidget {
  final List<Widget> children;
  final String? header;
  final Widget? headerSuffix;

  const CollapsingBlockContainer({
    super.key,
    this.header,
    this.headerSuffix,
    required this.children,
  });

  @override
  State<StatefulWidget> createState() => _CollapsingBlockContainerState();
}

class _CollapsingBlockContainerState extends State<CollapsingBlockContainer> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _contentPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(Radii.normal)),
      ),
      child: Column(
        children: [
          _headerWidget,
          _children,
        ],
      ),
    );
  }

  Widget get _children => SizeAnimationContainer(
        duration: AnimationDuration.short,
        child: isCollapsed ? _empty : _content,
      );

  Widget get _empty => const SizedBox(
        width: double.infinity,
      );

  Widget get _content => Padding(
        padding: _childrenPadding,
        child: PageContainer(
          isScrollable: false,
          contentPadding: EdgeInsets.zero,
          children: widget.children,
        ),
      );

  Widget get _headerWidget => GestureDetector(
        onTap: () {
          setState(() {
            isCollapsed = !isCollapsed;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: _headerContent,
      );

  Widget get _headerContent => Row(
        children: [
          _headerText,
          AppPadding.tiny.expanded(),
          _headerSuffix,
        ],
      );

  Widget get _headerText => AppText(
        text: widget.header ?? '',
        style: AppTextStyle.subtitle1,
      );

  Widget get _headerSuffix => widget.headerSuffix ?? suffixIcon(isCollapsed);

  Widget suffixIcon(bool isCollapsed) {
    return AnimatedSwitcher(
      duration: AnimationDuration.short,
      transitionBuilder: _widgetTransition,
      child: isCollapsed ? _collapsedSuffixIcon : _expandedSuffixIcon,
    );
  }

  Widget get _expandedSuffixIcon => AssetsImage(
        path: ImageAssets.collapsing,
        color: context.colorScheme.onSurface,
      );

  Widget get _collapsedSuffixIcon => RotatedBox(
        quarterTurns: QuarterTurns.half,
        child: AssetsImage(
          path: ImageAssets.collapsing,
          color: context.colorScheme.onSurface,
        ),
      );

  Widget _widgetTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: RotationTransition(
        turns: animationTween(child).animate(animation),
        child: child,
      ),
    );
  }

  Tween<double> animationTween(Widget child) {
    if (child.runtimeType == _collapsedSuffixIcon.runtimeType) {
      return TurnTween.half;
    }
    return TurnTween.reverseHalf;
  }
}
