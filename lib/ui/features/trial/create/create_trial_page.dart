import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:offsite_trial_establishment_app/common/constants/date_format.dart';
import 'package:offsite_trial_establishment_app/common/constants/input_formatters.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/constants/validation_keys.dart';
import 'package:offsite_trial_establishment_app/common/utils/text_masks.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/trial/create/create_trial_view_model.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/app_screen.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/app_button.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/block_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/page_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/app_text_field.dart';

class CreateTrialPage extends AppPage<CreateTrialViewModel> {
  CreateTrialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => AppScreen(
        bodyBuilder: _body,
        ignoreBottomSafeArea: true,
        title:
            viewModel.titleDate != null ? DateFormats.dateAndTime.format(viewModel.titleDate!) : Strings.trial.title(),
        showChangePageButtons: true,
        onNextPage: viewModel.activeNextButton ? viewModel.openNext : null,
        onPreviousPage: viewModel.activePreviousButton ? viewModel.openPrevious : null,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return PageContainer(
      children: [
        _trial,
        _contact,
        _button,
      ],
    );
  }

  Widget get _button => AppButton(
        onPressed: viewModel.save,
        text: Strings.trial.button(),
      );

  Widget get _trial => BlockContainer(
        header: Strings.trial.trialTitle(),
        children: [
          _trialNickname,
        ],
      );

  Widget get _contact => BlockContainer(
        header: Strings.trial.contactTitle(),
        children: [
          _contactId,
          _organization,
          _objective,
          _lastName,
          _firstName,
          _email,
          _phone,
        ],
      );

  Widget get _trialNickname => Observer(
        builder: (_) => AppTextField(
          value: viewModel.trial?.nickname ?? '',
          hintText: Strings.trial.trialNickname(),
          onChanged: viewModel.updateTrialNickname,
          validationKey: ValidationKeys.trial.nickname,
        ),
      );

  Widget get _contactId => Observer(
        builder: (_) => AppTextField(
          value: viewModel.trial?.contact?.id ?? '',
          hintText: Strings.trial.contactId(),
          onChanged: viewModel.updateContactId,
          validationKey: ValidationKeys.trial.contactId,
        ),
      );

  Widget get _organization => Observer(
        builder: (_) => AppTextField(
          value: viewModel.trial?.contact?.organization ?? '',
          hintText: Strings.trial.organization(),
          onChanged: viewModel.updateOrganization,
          keyboardType: TextInputType.name,
          validationKey: ValidationKeys.trial.organization,
        ),
      );

  Widget get _lastName => Observer(
        builder: (_) => AppTextField(
          value: viewModel.trial?.contact?.lastName ?? '',
          hintText: Strings.trial.lastName(),
          onChanged: viewModel.updateLastName,
          textCapitalization: TextCapitalization.words,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _firstName => Observer(
        builder: (_) => AppTextField(
          value: viewModel.trial?.contact?.firstName ?? '',
          hintText: Strings.trial.firstName(),
          onChanged: viewModel.updateFirstName,
          textCapitalization: TextCapitalization.words,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _email => Observer(
        builder: (_) => AppTextField(
          value: viewModel.trial?.contact?.email ?? '',
          hintText: Strings.trial.email(),
          onChanged: viewModel.updateEmail,
          keyboardType: TextInputType.emailAddress,
          helperText: Strings.common.nonMandatory(),
          validationKey: ValidationKeys.trial.email,
        ),
      );

  Widget get _phone => Observer(
        builder: (_) => AppTextField(
          value: CanadaPhoneFormatter.format(viewModel.trial?.contact?.phone),
          hintText: Strings.trial.phone(),
          onChanged: viewModel.updatePhone,
          keyboardType: TextInputType.number,
          inputFormatters: AppFormat.phone,
          helperText: Strings.common.nonMandatory(),
          validationKey: ValidationKeys.trial.phone,
        ),
      );

  Widget get _objective => Observer(
        builder: (_) => AppTextField.multiline(
          value: viewModel.trial?.objective ?? '',
          hintText: Strings.trial.objective(),
          onChanged: viewModel.updateObjective,
          validationKey: ValidationKeys.trial.objective,
        ),
      );
}
