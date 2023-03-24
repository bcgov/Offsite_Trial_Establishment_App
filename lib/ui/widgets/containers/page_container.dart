import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/lists/app_scroll_view.dart';

final _contentPadding = EdgeInsets.symmetric(vertical: AppPadding.tiny.size, horizontal: AppPadding.extraSmall.size);

class PageContainer extends StatelessWidget {
  final List<Widget> children;
  final bool isScrollable;
  final EdgeInsets? contentPadding;

  const PageContainer({
    super.key,
    required this.children,
    this.contentPadding,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isScrollable) {
      return AppScrollView(
        padding: contentPadding ?? _contentPadding,
        isRoot: true,
        children: _mappedChildren,
      );
    }
    return Padding(
      padding: contentPadding ?? _contentPadding,
      child: Column(
        children: _mappedChildren,
      ),
    );
  }

  List<Widget> get _mappedChildren => children.mapList(
        (e) => Padding(
          padding: EdgeInsets.symmetric(vertical: AppPadding.tiny.size),
          child: e,
        ),
      );
}
