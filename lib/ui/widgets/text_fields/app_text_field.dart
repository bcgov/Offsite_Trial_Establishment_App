import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offsite_trial_establishment_app/common/constants/input_formatters.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/text_editing_controller_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text_fields/app_text_field_style.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onSubmitted;
  final String? value;
  final String? hintText;
  final int? maxCharLength;
  final Widget? suffix;
  final Color? color;
  final bool autocorrect;
  final bool trimSpaces;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool disabled;
  final bool hideBottomText;
  final int? maxLines;
  final String? validationKey;
  final String? error;
  final TextCapitalization textCapitalization;
  final bool isDouble;
  final VoidCallback? onTap;
  final String? helperText;

  const AppTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.value,
    this.hintText = '',
    this.maxCharLength,
    this.suffix,
    this.color,
    this.autocorrect = true,
    this.trimSpaces = false,
    this.focusNode,
    this.onFocusChanged,
    this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.validationKey,
    this.readOnly = false,
    this.disabled = false,
    this.hideBottomText = false,
    this.error,
    this.textCapitalization = TextCapitalization.none,
    this.isDouble = false,
    this.onTap,
    this.helperText,
  }) : assert(controller == null || value == null);

  const AppTextField.multiline({
    super.key,
    this.controller,
    this.onSubmitted,
    this.value,
    this.hintText = '',
    this.maxCharLength,
    this.suffix,
    this.color,
    this.autocorrect = true,
    this.trimSpaces = false,
    this.focusNode,
    this.onFocusChanged,
    this.onChanged,
    this.inputFormatters,
    this.textInputAction = TextInputAction.newline,
    this.style,
    this.validationKey,
    this.readOnly = false,
    this.disabled = false,
    this.hideBottomText = false,
    this.error,
    this.textCapitalization = TextCapitalization.sentences,
    this.isDouble = false,
    this.onTap,
    this.helperText,
  })  : keyboardType = TextInputType.multiline,
        maxLines = null,
        assert(controller == null || value == null);

  @override
  State<StatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> with ErrorState, AppTextFieldStyle {
  late var _controller = widget.controller ?? TextEditingController(text: widget.value);
  FocusNode? _focusNode;

  List<TextInputFormatter>? get inputFormatters {
    if (widget.inputFormatters != null) return widget.inputFormatters;
    if (widget.maxLines == 1) return AppFormat.base;
    return null;
  }

  @override
  String? get error => widget.error ?? _error;

  @override
  bool get hideBottomText => error == null && widget.hideBottomText;

  String? _error;

  @override
  void showError(String error) {
    setState(() {
      _error = error;
    });
  }

  @override
  String? validationKeyOf(covariant AppTextField widget) => widget.validationKey;

  @override
  void initState() {
    super.initState();
    _settingFocusNodeIfNeed();
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    if (oldWidget.controller != widget.controller) {
      if (widget.controller != null && _controller.text != widget.controller?.text) {
        _removeErrorIfNeed();
      }
      _controller = widget.controller ?? _controller;
    }
    if (oldWidget.value != widget.value) {
      _controller.updateText(widget.value, saveLastPosition: !widget.isDouble);
      _removeErrorIfNeed();
    }
    if (oldWidget.focusNode != widget.focusNode || oldWidget.onFocusChanged != widget.onFocusChanged) {
      _settingFocusNodeIfNeed();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget buildContent(BuildContext context) {
    return wrapper(
      helperText: widget.helperText,
      child: TextField(
        controller: _controller,
        onSubmitted: widget.onSubmitted,
        autocorrect: widget.autocorrect,
        style: textStyle,
        maxLength: widget.maxCharLength,
        focusNode: _focusNode ?? widget.focusNode,
        onChanged: _onChanged,
        keyboardType: widget.keyboardType,
        inputFormatters: inputFormatters,
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        enabled: !widget.disabled,
        decoration: getInputDecoration(widget.hintText, widget.suffix),
        textCapitalization: widget.textCapitalization,
        onTap: widget.onTap,
      ),
    );
  }

  void _onChanged(String str) {
    if (widget.trimSpaces) {
      _controller.trim();
    }
    widget.onChanged?.call(_controller.text);
    _removeErrorIfNeed();
  }

  void _removeErrorIfNeed() {
    if (_error != null) {
      setState(() {
        _error = null;
      });
    }
  }

  void _settingFocusNodeIfNeed() {
    _focusNode?.removeListener(_didFocusChanged);
    _focusNode = _createFocusNode();
    _focusNode?.addListener(_didFocusChanged);
  }

  void _didFocusChanged() {
    if (_focusNode != null) widget.onFocusChanged?.call(_focusNode!.hasFocus);
  }

  FocusNode? _createFocusNode() {
    if (widget.focusNode != null) return widget.focusNode;
    if (_focusNode != null) return _focusNode;
    if (widget.onFocusChanged != null) return FocusNode();
    return null;
  }
}
