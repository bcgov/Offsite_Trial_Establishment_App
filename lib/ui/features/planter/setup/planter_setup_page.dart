import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:offsite_trial_establishment_app/common/constants/input_formatters.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/constants/validation_keys.dart';
import 'package:offsite_trial_establishment_app/common/utils/text_masks.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/planter/setup/planter_setup_view_model.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/app_screen.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/app_button.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/button_type.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/block_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/page_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/app_text_field.dart';

class PlanterSetupPage extends AppPage<PlanterSetupViewModel> {
  PlanterSetupPage({
    Key? key,
    bool isCreating = false,
  }) : super(
          key: key,
          viewModel: getIt(
            param1: isCreating,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      bodyBuilder: _body,
      ignoreBottomSafeArea: true,
      title: viewModel.isCreating ? Strings.planter.titleCreating() : Strings.planter.title(),
      showBackButton: !viewModel.isCreating,
    );
  }

  Widget _body(BuildContext context) {
    return PageContainer(
      children: [
        _fields,
        _button,
        if (!viewModel.isCreating) _logoutButton(context),
      ],
    );
  }

  Widget get _button => AppButton(
        onPressed: viewModel.save,
        text: viewModel.isCreating ? Strings.planter.buttonCreating() : Strings.planter.button(),
      );

  Widget _logoutButton(BuildContext context) => AppButton(
        onPressed: viewModel.logout,
        text: Strings.planter.logoutButton(),
        type: ButtonType.text,
        textColor: context.colorScheme.error,
      );

  Widget get _fields => BlockContainer(
        children: [
          _nickname,
          _organization,
          _lastName,
          _firstName,
          _email,
          _phone,
        ],
      );

  Widget get _nickname => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planter?.nickname ?? '',
          hintText: Strings.planter.nickname(),
          onChanged: viewModel.updateNickname,
          validationKey: ValidationKeys.planter.nickname,
          readOnly: !viewModel.isCreating,
          onFocusChanged: viewModel.isCreating
              ? (hasFocus) {
                  if (!hasFocus) viewModel.loadPlanterInfo();
                }
              : null,
        ),
      );

  Widget get _organization => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planter?.organization ?? '',
          hintText: Strings.planter.organization(),
          onChanged: viewModel.updateOrganization,
          keyboardType: TextInputType.name,
          validationKey: ValidationKeys.planter.organization,
        ),
      );

  Widget get _lastName => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planter?.lastName ?? '',
          hintText: Strings.planter.lastName(),
          onChanged: viewModel.updateLastName,
          textCapitalization: TextCapitalization.words,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _firstName => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planter?.firstName ?? '',
          hintText: Strings.planter.firstName(),
          onChanged: viewModel.updateFirstName,
          textCapitalization: TextCapitalization.words,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _email => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planter?.email ?? '',
          hintText: Strings.planter.email(),
          onChanged: viewModel.updateEmail,
          keyboardType: TextInputType.emailAddress,
          helperText: Strings.common.nonMandatory(),
          validationKey: ValidationKeys.planter.email,
        ),
      );

  Widget get _phone => Observer(
        builder: (_) => AppTextField(
          value: CanadaPhoneFormatter.format(viewModel.planter?.phone),
          hintText: Strings.planter.phone(),
          onChanged: viewModel.updatePhone,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          inputFormatters: AppFormat.phone,
          helperText: Strings.common.nonMandatory(),
          validationKey: ValidationKeys.planter.phone,
          onSubmitted: (_) => viewModel.save(),
        ),
      );
}
