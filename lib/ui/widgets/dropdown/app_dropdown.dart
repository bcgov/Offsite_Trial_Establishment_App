import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:offsite_trial_establishment_app/common/constants/image_assets.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/assets_image.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dropdown/app_dropdown_item.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/app_text_field_style.dart';

class AppDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onSelect;
  final String Function(T) stringBuilder;
  final String hintText;
  final String? validationKey;
  final String? helperText;

  const AppDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelect,
    required this.hintText,
    required this.stringBuilder,
    this.helperText,
    this.validationKey,
  });

  @override
  State<StatefulWidget> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> with ErrorState, AppTextFieldStyle {
  final focusNode = FocusNode();

  @override
  String? error;

  @override
  bool get hideBottomText => false;

  @override
  void showError(String error) {
    setState(() {
      this.error = error;
    });
  }

  @override
  String? validationKeyOf(covariant AppDropdown<T> widget) => widget.validationKey;

  ValueChanged<T?> get onSelect => widget.onSelect;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      focusNode.unfocus(); // for correct state of label
    });
  }

  @override
  void didUpdateWidget(covariant AppDropdown<T> oldWidget) {
    if (oldWidget.selectedItem != widget.selectedItem) {
      _removeErrorIfNeed();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget buildContent(BuildContext context) {
    return wrapper(
      helperText: widget.helperText,
      child: DropdownButtonFormField(
        icon: const SizedBox(),
        onChanged: _onSelect,
        focusNode: focusNode,
        decoration: getInputDecoration(widget.hintText, suffix),
        value: widget.selectedItem,
        items: widget.items.mapList(
          (e) => DropdownMenuItem(
            value: e,
            child: AppDropdownItem(
              item: e,
              stringBuilder: widget.stringBuilder,
            ),
          ),
        ),
      ),
    );
  }

  Widget get suffix => const AssetsImage(
        path: ImageAssets.dropdownSuffix,
      );

  void _onSelect(T? value) {
    widget.onSelect(value);
    _removeErrorIfNeed();
  }

  void _removeErrorIfNeed() {
    if (error != null) {
      setState(() {
        error = null;
      });
    }
  }
}
