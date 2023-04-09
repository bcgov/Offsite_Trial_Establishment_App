import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offsite_trial_establishment_app/common/constants/image_assets.dart';
import 'package:offsite_trial_establishment_app/common/constants/opacity.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/radii.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/app_padding_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/home/home_view_model.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/app_progress_bar.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/app_screen.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/app_button.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/button_type.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/card_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/lists/app_scroll_view.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/size_animation_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

final _cardMinHeight = 223.w;
final _cardWidth = 98.w;
final _primaryCardWidth = 155.w;
final _statusPadding = EdgeInsets.only(
  left: AppPadding.large.size,
  bottom: AppPadding.large.size,
  right: AppPadding.large.size,
);
const _noLoadingKey = ValueKey('noLoading');
const _progressKey = ValueKey('progress');
const _successKey = ValueKey('success');
const _errorKey = ValueKey('error');

class HomePage extends AppPage<HomeViewModel> {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollAppScreen(
      bodyBuilder: _body,
      backgroundColor: context.colorScheme.secondaryContainer,
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        _logo,
        _title(context),
        _sendingStatus,
        _list(context),
      ],
    );
  }

  Widget get _logo => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.secondaryNormal.size,
          vertical: AppPadding.normal.size,
        ),
        child: Row(
          children: [
            const AssetsImage(
              path: ImageAssets.logo,
            ),
            AppPadding.normal.expanded(),
          ],
        ),
      );

  Widget _title(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.large.size,
          vertical: AppPadding.extraLarge.size,
        ),
        child: AppText(
          text: Strings.home.title(),
          style: AppTextStyle.headline4,
          color: context.colorScheme.onSurface,
          textAlign: TextAlign.center,
        ),
      );

  Widget get _sendingStatus => Observer(
        builder: (context) => SizeAnimationContainer(
          child: viewModel.status.map(
            sending: (value) => _progressSending(context, value.completedCount, value.allCount),
            noLoading: (_) => SizedBox(key: _noLoadingKey, width: double.infinity),
            success: (_) => _successSending(context),
            error: (value) => _errorSending(context, value.message),
          ),
        ),
      );

  Widget _progressSending(BuildContext context, int completedCount, int allCount) => Padding(
        padding: _statusPadding,
        child: AppProgressBar(
          key: _progressKey,
          progress: completedCount,
          all: allCount,
          title: Strings.home.sendingTitle(),
        ),
      );

  Widget _successSending(BuildContext context) => _sendingWrapper(
        key: _successKey,
        color: context.colorScheme.secondary,
        child: Row(
          children: [
            const AssetsImage(path: ImageAssets.success),
            AppPadding.normal.spacer,
            AppText(
              text: Strings.home.successSending(),
              style: AppTextStyle.body1,
            ),
          ],
        ),
      );

  Widget _errorSending(BuildContext context, String? error) => _sendingWrapper(
        key: _errorKey,
        color: context.colorScheme.error.withOpacity(Opacities.errorCardOpacity),
        child: Column(
          children: [
            AppText(
              text: error ?? Strings.home.defaultErrorSending(),
              style: AppTextStyle.body1,
              width: double.infinity,
            ),
            AppPadding.normal.spacer,
            AppButton(
              onPressed: viewModel.retry,
              text: Strings.home.errorSendingButton(),
              type: ButtonType.outline,
              textColor: context.colorScheme.onSurface,
            ),
          ],
        ),
      );

  Widget _sendingWrapper({
    required Key key,
    required Color color,
    required Widget child,
  }) =>
      Padding(
        key: key,
        padding: _statusPadding,
        child: Container(
          padding: EdgeInsets.all(AppPadding.large.size),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(Radii.normal)),
          ),
          child: child,
        ),
      );

  Widget _list(BuildContext context) => Expanded(
        child: Container(
          constraints: BoxConstraints(minHeight: _cardMinHeight, minWidth: double.infinity),
          child: AppScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppPadding.normal.size),
            children: [
              planting(context),
              trial(context),
              planter(context),
            ],
          ),
        ),
      );

  Widget planting(BuildContext context) => card(
        context: context,
        image: ImageAssets.will_logo,
        text: Strings.home.planting(),
        onTap: viewModel.openPlanting,
        isPrimary: false,
      );

  Widget trial(BuildContext context) => card(
        context: context,
        image: ImageAssets.trial,
        text: Strings.home.trial(),
        onTap: viewModel.openTrial,
      );

  Widget planter(BuildContext context) => card(
        context: context,
        image: ImageAssets.planter,
        text: Strings.home.planter(),
        onTap: viewModel.openPlanter,
      );

  Widget card({
    required BuildContext context,
    required String image,
    required String text,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.extraSmall.size),
        child: GestureDetector(
          onTap: onTap,
          child: CardContainer(
            color: isPrimary ? context.colorScheme.primary : context.colorScheme.surface,
            center: AssetsImage(path: image, width: 100, height: 100),
            bottom: AppText(
              text: text,
              style: AppTextStyle.subtitle1,
              color: isPrimary ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
              width: isPrimary ? _primaryCardWidth : _cardWidth,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
