import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/default_app_bar.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/lists/app_scroll_behavior.dart';

class AppScreen extends StatelessWidget {
  final WidgetBuilder bodyBuilder;
  final EdgeInsets? padding;
  final String? title;
  final VoidCallback? onClose;
  final bool ignoreBottomSafeArea;
  final bool ignoreTopSafeArea;
  final bool showChangePageButtons;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;
  final Color? backgroundColor;
  final bool showBackButton;

  const AppScreen({
    super.key,
    required this.bodyBuilder,
    this.padding,
    this.title,
    this.onClose,
    this.backgroundColor,
    this.showBackButton = true,
    this.showChangePageButtons = false,
    this.onPreviousPage,
    this.onNextPage,
    this.ignoreBottomSafeArea = false,
    this.ignoreTopSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.colorScheme.secondary,
      body: SafeArea(
        top: title == null && onClose == null && !ignoreTopSafeArea,
        bottom: !ignoreBottomSafeArea,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: body(context),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    if (title == null && onClose == null) return bodyBuilder(context);
    return Column(
      children: [
        DefaultAppBar(
          title: title ?? '',
          onClosePressed: onClose ?? () => Navigator.of(context).pop(),
          showBackButton: showBackButton,
          showChangePageButtons: showChangePageButtons,
          onPreviousPage: onPreviousPage,
          onNextPage: onNextPage,
        ),
        Expanded(
          child: bodyBuilder(context),
        ),
      ],
    );
  }
}

class ScrollAppScreen extends StatelessWidget {
  final WidgetBuilder bodyBuilder;
  final EdgeInsets? padding;
  final String? title;
  final VoidCallback? onClose;
  final Color? backgroundColor;
  final bool showBackButton;
  final bool showChangePageButtons;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;

  const ScrollAppScreen({
    super.key,
    required this.bodyBuilder,
    this.padding,
    this.title,
    this.onClose,
    this.backgroundColor,
    this.showBackButton = true,
    this.showChangePageButtons = false,
    this.onPreviousPage,
    this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      bodyBuilder: _body,
      padding: padding,
      title: title,
      onClose: onClose,
      ignoreBottomSafeArea: true,
      ignoreTopSafeArea: true,
      showChangePageButtons: showChangePageButtons,
      onPreviousPage: onPreviousPage,
      onNextPage: onNextPage,
      backgroundColor: backgroundColor,
      showBackButton: showBackButton,
    );
  }

  Widget _body(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              left: false,
              right: false,
              child: bodyBuilder(context),
            ),
          ),
        ],
      ),
    );
  }
}
