import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:offsite_trial_establishment_app/common/constants/accuracy.dart';
import 'package:offsite_trial_establishment_app/common/constants/date_format.dart';
import 'package:offsite_trial_establishment_app/common/constants/image_assets.dart';
import 'package:offsite_trial_establishment_app/common/constants/input_formatters.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/constants/validation_keys.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/utils/text_masks.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/enum_ext.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/planting/create/create_planting_view_model.dart';
import 'package:offsite_trial_establishment_app/ui/models/filtered_species.dart';
import 'package:offsite_trial_establishment_app/ui/models/filtered_trial.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/app_screen.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/app_button.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/button/button_type.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/block_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/collapsing_block_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/internal_block_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/containers/page_container.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dropdown/app_dropdown.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/photo_card.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/app_text_field.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/autocomplete_text_field.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/trailing_text_field_icon.dart';

const _minPhotoWidth = 90;

class CreatePlantingPage extends AppPage<CreatePlantingViewModel> {
  CreatePlantingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => AppScreen(
        bodyBuilder: _body,
        ignoreBottomSafeArea: true,
        title: viewModel.titleDate != null
            ? "Previous Trial: ${DateFormats.dateAndTime.format(viewModel.titleDate!)}"
            : Strings.planting.title(),
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
        _seedlings,
        _site,
        _saveButton,
      ],
    );
  }

  Widget get _saveButton => AppButton(
        onPressed: viewModel.save,
        text: Strings.planting.button(),
      );

  Widget get _trial => BlockContainer(
        header: Strings.planting.blockTitle(),
        children: [
          _trialNickname,
          _ownerId,
          _plantingId,
          _blockId,
          _date,
          _location,
          _addImage,
          _photoList,
        ],
      );

  Widget get _trialNickname => Observer(
        builder: (_) => AutocompleteTextField<FilteredTrial>(
          value: FilteredTrial.create(viewModel.planting?.trial),
          hintText: Strings.planting.trialNickname(),
          validationKey: ValidationKeys.planting.trialNickname,
          values: viewModel.trials,
          onSelected: (value) => viewModel.selectTrial(value?.value),
          suffix: TrailingTextFieldIcon(
            onPressed: viewModel.createTrial,
            icon: ImageAssets.add,
          ),
        ),
      );

  // Widget get _trialNickname => Observer(
  //   builder: (_) => AppDropdown(
  //     selectedItem: FilteredTrial.create(viewModel.planting?.trial),
  //     hintText: Strings.planting.trialNickname(),
  //     items: viewModel.trials.toSet().toList(),
  //     onSelect: (value) => viewModel.selectTrial(value?.value),
  //     stringBuilder: (e) => e.toString(),
  //     //helperText: Strings.common.nonMandatory(),
  //   ),
  // );

  Widget get _ownerId => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planting?.trial?.contact?.id ?? '',
          hintText: Strings.planting.contactId(),
          validationKey: ValidationKeys.planting.contactId,
          readOnly: true,
        ),
      );

  Widget get _plantingId => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planting?.plantingId ?? '',
          hintText: Strings.planting.plantingId(),
          validationKey: ValidationKeys.planting.plantingId,
          readOnly: true,
        ),
      );

  Widget get _blockId => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planting?.blockId ?? '',
          hintText: Strings.planting.blockId(),
          onChanged: viewModel.updateBlockId,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _date => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planting?.date != null ? DateFormats.date.format(viewModel.planting!.date) : '',
          hintText: Strings.planting.date(),
          validationKey: ValidationKeys.planting.date,
          readOnly: true,
          onTap: viewModel.updateDate,
        ),
      );

  Widget get _location => InternalBlockContainer(
        children: [
          _latitude,
          _longitude,
          _elevation,
          _updateLocation,
        ],
      );

  Widget get _latitude => Observer(
        builder: (_) => AppTextField(
          value: DoubleFormatter.format(
            viewModel.planting?.location?.latitude?.toString() ?? '',
            accuracy: Accuracy.latitude,
            signed: true,
          ),
          hintText: Strings.planting.latitude(),
          onChanged: viewModel.updateLatitude,
          inputFormatters: AppFormat.double(
            accuracy: Accuracy.latitude,
            signed: true,
          ),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          validationKey: ValidationKeys.planting.latitude,
          isDouble: true,
        ),
      );

  Widget get _longitude => Observer(
        builder: (_) => AppTextField(
          value: DoubleFormatter.format(
            viewModel.planting?.location?.longitude?.toString() ?? '',
            accuracy: Accuracy.latitude,
            signed: true,
          ),
          hintText: Strings.planting.longitude(),
          onChanged: viewModel.updateLongitude,
          inputFormatters: AppFormat.double(
            accuracy: Accuracy.longitude,
            signed: true,
          ),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          validationKey: ValidationKeys.planting.longitude,
          isDouble: true,
        ),
      );

  Widget get _elevation => Observer(
        builder: (_) => AppTextField(
          value: ElevationFormatter.format(
            viewModel.planting?.location?.elevation?.toString() ?? '',
          ),
          hintText: Strings.planting.elevation(),
          onChanged: viewModel.updateElevation,
          inputFormatters: AppFormat.elevation,
          keyboardType: const TextInputType.numberWithOptions(signed: true),
          validationKey: ValidationKeys.planting.elevation,
          isDouble: true,
        ),
      );

  Widget get _updateLocation => AppButton(
        onPressed: viewModel.updateLocation,
        text: Strings.planting.locationButton(),
        type: ButtonType.outline,
        leadingImage: ImageAssets.location,
        validationKey: ValidationKeys.planting.photo,
      );

  Widget get _addImage => AppButton(
        onPressed: viewModel.canChangePhotos ? viewModel.addPhoto : null,
        text: Strings.planting.photoButton(),
        type: ButtonType.outline,
        leadingImage: ImageAssets.addPhoto,
        validationKey: ValidationKeys.planting.photo,
      );

  Widget get _photoList => LayoutBuilder(
        builder: (_, constraints) => Observer(
          builder: (context) => viewModel.photoPaths.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.only(
                    top: AppPadding.secondaryNormal.size,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth ~/ _minPhotoWidth,
                    crossAxisSpacing: AppPadding.normal.size,
                    mainAxisSpacing: AppPadding.normal.size,
                    childAspectRatio: 1 / 1,
                  ),
                  itemBuilder: (context, i) => PhotoCard(
                    photo: viewModel.photoPaths[i],
                    onRemove: viewModel.canChangePhotos ? viewModel.removePhoto : null,
                  ),
                  itemCount: viewModel.photoPaths.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                )
              : const SizedBox(),
        ),
      );

  Widget get _site => CollapsingBlockContainer(
        header: Strings.planting.site.title(),
        children: [
          _series,
          _smr,
          _snr,
          _soil,
          _preparation,
        ],
      );

  Widget get _series => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planting?.site?.series,
          hintText: Strings.planting.site.series(),
          onChanged: viewModel.updateSeries,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _smr => Observer(
        builder: (_) => AppDropdown(
          selectedItem: viewModel.planting?.site?.smr,
          hintText: Strings.planting.site.smr(),
          items: Smr.values,
          onSelect: viewModel.selectSmr,
          stringBuilder: (e) => e.text,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _snr => Observer(
        builder: (_) => AppDropdown(
          selectedItem: viewModel.planting?.site?.snr,
          hintText: Strings.planting.site.snr(),
          items: Snr.values,
          onSelect: viewModel.selectSnr,
          stringBuilder: (e) => e.text,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _soil => Observer(
        builder: (_) => AppDropdown(
          selectedItem: viewModel.planting?.site?.soil,
          hintText: Strings.planting.site.soil(),
          items: Soil.values,
          onSelect: viewModel.selectSoil,
          stringBuilder: (e) => e.text,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _preparation => Observer(
        builder: (_) => AppDropdown(
          selectedItem: viewModel.planting?.site?.preparation,
          hintText: Strings.planting.site.preparation(),
          items: Preparation.values,
          onSelect: viewModel.selectPreparation,
          stringBuilder: (e) => e.text,
          helperText: Strings.common.nonMandatory(),
        ),
      );

  Widget get _seedlings => BlockContainer(
        header: Strings.planting.seedlings.title(),
        children: [
          _species,
          _count,
          _seedlot,
          _spacing,
          _notes,
        ],
      );

  Widget get _count => Observer(
        builder: (_) {
          final count = viewModel.planting?.seedlings?.count ?? -1;
          return AppTextField(
            value: count >= 0 ? IntegerFormatter.format('$count') : '',
            hintText: Strings.planting.seedlings.count(),
            onChanged: viewModel.updateCount,
            validationKey: ValidationKeys.planting.seedlings.count,
            inputFormatters: AppFormat.number(),
            keyboardType: TextInputType.number,
          );
        },
      );

  Widget get _species => Observer(
        builder: (_) => AutocompleteTextField<FilteredSpecies>(
          value: FilteredSpecies.create(viewModel.planting?.seedlings?.species),
          hintText: Strings.planting.seedlings.species(),
          onSelected: (value) => viewModel.updateSpecies(value?.value),
          validationKey: ValidationKeys.planting.seedlings.species,
          values: Species.values.mapList((e) => FilteredSpecies(e)),
          suffix: const TrailingTextFieldIcon(
            icon: ImageAssets.dropdownSuffix,
          ),
        ),
      );

  Widget get _seedlot => Observer(
        builder: (_) => AppTextField(
          value: viewModel.planting?.seedlings?.seedlot,
          hintText: Strings.planting.seedlings.seedlot(),
          onChanged: viewModel.updateSeedlot,
          validationKey: ValidationKeys.planting.seedlings.seedlot,
        ),
      );



  Widget get _spacing => Observer(
        builder: (_) {
          final value = viewModel.planting?.seedlings?.spacing ?? -1.0;
          return AppTextField(
            value: value >= 0 ? SpacingFormatter.format('$value') : '',
            hintText: Strings.planting.seedlings.spacing(),
            onChanged: viewModel.updateSpacing,
            inputFormatters: AppFormat.spacing,
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            validationKey: ValidationKeys.planting.seedlings.spacing,
            isDouble: true,
          );
        },
      );

  Widget get _notes => Observer(
        builder: (_) => AppTextField.multiline(
          value: viewModel.planting?.seedlings?.notes,
          hintText: Strings.planting.seedlings.notes(),
          onChanged: viewModel.updateNotes,
          helperText: Strings.common.nonMandatory(),
        ),
      );
}
