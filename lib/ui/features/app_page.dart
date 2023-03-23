import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:offsite_trial_establishment_app/common/utils/keyboard_utils.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_view_model.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/dialog_widget.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';

abstract class AppPage<T extends AppViewModel> extends StatefulWidget {
  final T viewModel;

  @override
  State<StatefulWidget> createState() => _AppPageState();

  AppPage({
    Key? key,
    T? viewModel,
  })  : viewModel = viewModel ?? getIt(),
        super(key: key);

  Widget build(BuildContext context);
}

class _AppPageState<T extends AppViewModel> extends State<AppPage<T>> {
  T get _viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: _builder,
    );
  }

  Widget _builder(BuildContext ctx) => DialogWidget(
        dialog: _viewModel.dialog,
        closeDialog: _viewModel.closeDialog,
        child: GestureDetector(
          onTap: KeyboardUtils.hide,
          behavior: HitTestBehavior.opaque,
          child: ErrorPage(
            child: widget.build(context),
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
