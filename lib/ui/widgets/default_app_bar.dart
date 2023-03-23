import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/image_assets.dart';
import 'package:offsite_trial_establishment_app/common/constants/opacity.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

final _contentPadding = EdgeInsets.symmetric(
  vertical: AppPadding.extraSmall.size,
  horizontal: AppPadding.small.size,
);
final _titlePadding = EdgeInsets.all(AppPadding.large.size);

class DefaultAppBar extends StatelessWidget {
  final VoidCallback? onClosePressed;
  final String title;
  final bool showBackButton;
  final bool showChangePageButtons;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;

  const DefaultAppBar({
    super.key,
    this.onClosePressed,
    required this.title,
    this.showBackButton = true,
    this.showChangePageButtons = false,
    this.onPreviousPage,
    this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      padding: _contentPadding,
      child: SafeArea(
        left: false,
        bottom: false,
        right: false,
        child: Row(
          children: [
            if (showBackButton) _close,
            Expanded(child: _text),
            if (showChangePageButtons) _changePageButtons,
          ],
        ),
      ),
    );
  }

  Widget get _close => GestureDetector(
        onTap: onClosePressed,
        child: const AssetsImage(
          path: ImageAssets.close,
        ),
      );

  Widget get _text => Padding(
        padding: showBackButton ? EdgeInsets.zero : _titlePadding,
        child: AppText(
          text: title,
          softWrap: true,
          width: double.infinity,
          style: AppTextStyle.headline6,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget get _changePageButtons => Row(
        children: [
          if (onPreviousPage != null) _previousPage,
          _nextPage,
        ],
      );

  Widget get _previousPage => GestureDetector(
        onTap: onPreviousPage,
        child: AssetsImage(
          path: ImageAssets.previousPage,
          opacity: onPreviousPage == null ? Opacities.percentage38 : Opacities.full,
        ),
      );

  Widget get _nextPage => GestureDetector(
        onTap: onNextPage,
        child: AssetsImage(
          path: ImageAssets.nextPage,
          opacity: onNextPage == null ? Opacities.percentage38 : Opacities.full,
        ),
      );
}
