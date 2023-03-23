import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/utils/keyboard_utils.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/app_text_field.dart';

const _optionsHeight = 200.0;
const _elevation = 4.0;

abstract class FilteredObject {
  bool contains(String text);
}

class AutocompleteTextField<T extends FilteredObject> extends StatefulWidget {
  final Iterable<T> values;
  final T? value;
  final String Function(T)? stringBuilder;
  final String hintText;
  final AutocompleteOptionsBuilder<T>? optionsBuilder;
  final Function(T?) onSelected;
  final Function()? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? validationKey;
  final Widget? suffix;

  const AutocompleteTextField({
    Key? key,
    this.value,
    required this.values,
    required this.hintText,
    this.stringBuilder,
    this.optionsBuilder,
    this.onSubmitted,
    this.textInputAction,
    this.inputFormatters,
    this.validationKey,
    this.suffix,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutocompleteTextFieldState<T>();
}

class _AutocompleteTextFieldState<T extends FilteredObject> extends State<AutocompleteTextField<T>> with ErrorState {
  String Function(T) get stringBuilder => widget.stringBuilder ?? _defaultStringBuilder;

  AutocompleteOptionsBuilder<T> get optionsBuilder => widget.optionsBuilder ?? _defaultFilter;

  final ValueNotifier<double?> optionsViewWidthNotifier = ValueNotifier(null);

  String? error;

  @override
  void showError(String error) {
    setState(() {
      this.error = error;
    });
  }

  @override
  String? validationKeyOf(covariant AutocompleteTextField<T> widget) => widget.validationKey;

  @override
  Widget buildContent(BuildContext context) {
    return Padding(
      padding: error == null ? EdgeInsets.only(bottom: AppPadding.large.size) : EdgeInsets.zero,
      child: Autocomplete<T>(
        displayStringForOption: stringBuilder,
        fieldViewBuilder: _viewBuilder,
        optionsBuilder: optionsBuilder,
        onSelected: (value) {
          widget.onSelected(value);
          (widget.onSubmitted ?? KeyboardUtils.hide).call();
        },
        initialValue: widget.value != null ? TextEditingValue(text: stringBuilder(widget.value!)) : null,
        optionsViewBuilder: _optionsViewBuilder,
      ),
    );
  }

  @override
  void dispose() {
    optionsViewWidthNotifier.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AutocompleteTextField<T> oldWidget) {
    if (oldWidget.value != widget.value) {
      _removeErrorIfNeed();
    }
    super.didUpdateWidget(oldWidget);
  }

  String _defaultStringBuilder(T value) {
    return value.toString();
  }

  Widget _viewBuilder(
    BuildContext context,
    TextEditingController textEditingController,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return OrientationBuilder(builder: (context, orientation) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        optionsViewWidthNotifier.value = (context.findRenderObject() as RenderBox).size.width;
        // getting width for limit options widget
      });
      if (widget.value != null) {
        final string = stringBuilder(widget.value!);
        if (string != textEditingController.text) {
          textEditingController.text = string;
          textEditingController.selection = TextSelection.collapsed(offset: string.length);
        }
      }
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          _removeErrorIfNeed();
        }
      });
      return AppTextField(
        controller: textEditingController,
        onSubmitted: (_) => onFieldSubmitted(),
        focusNode: focusNode,
        hintText: widget.hintText,
        textInputAction: widget.textInputAction,
        suffix: widget.suffix,
        inputFormatters: widget.inputFormatters,
        onChanged: _onChanged,
        hideBottomText: true,
        error: error,
      );
    });
  }

  FutureOr<Iterable<T>> _defaultFilter(TextEditingValue textEditingValue) {
    return widget.values.where((element) => element.contains(textEditingValue.text));
  }

  Widget _optionsViewBuilder(
    BuildContext context,
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
  ) {
    return ValueListenableBuilder<double?>(
        valueListenable: optionsViewWidthNotifier,
        builder: (context, width, child) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: _elevation,
              child: _optionsConstraints(onSelected, width, options),
            ),
          );
        });
  }

  Widget _optionsConstraints(
    AutocompleteOnSelected<T> onSelected,
    double? width,
    Iterable<T> options,
  ) =>
      ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: _optionsHeight,
          maxWidth: width ?? double.infinity,
        ),
        child: _optionsList(onSelected, options),
      );

  Widget _optionsList(
    AutocompleteOnSelected<T> onSelected,
    Iterable<T> options,
  ) =>
      ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          final T option = options.elementAt(index);
          return InkWell(
            onTap: () {
              onSelected(option);
            },
            child: Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(AppPadding.normal.size),
                  child: Text(
                    stringBuilder(option),
                  ),
                );
              },
            ),
          );
        },
      );

  void _onChanged(_) {
    widget.onSelected(null);
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
