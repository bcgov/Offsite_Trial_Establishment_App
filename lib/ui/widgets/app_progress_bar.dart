import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/paddings.dart';
import 'package:offsite_trial_establishment_app/common/constants/typography.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/app_padding_ext.dart';
import 'package:offsite_trial_establishment_app/ui/extensions/context_ext.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/text/app_text.dart';

const _defaultDuration = Duration(seconds: 3);

class AppProgressBar extends StatefulWidget {
  final int progress;
  final int all;
  final String title;
  final Duration duration;

  const AppProgressBar({
    super.key,
    required this.progress,
    required this.all,
    required this.title,
    this.duration = _defaultDuration,
  });

  @override
  State<StatefulWidget> createState() => _AppProgressBarState();
}

class _AppProgressBarState extends State<AppProgressBar> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    _createController(isInit: true);
    super.initState();
  }

  void _createController({double? oldValue, bool isInit = false}) {
    if (!mounted) return;
    final start = oldValue ?? _value();
    final end = _value();
    if (!isInit) {
      controller.dispose();
    }
    controller = AnimationController(
      vsync: this,
      duration: widget.duration * (end - start).abs(),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    animation = Tween(begin: start, end: end).animate(controller);
  }

  @override
  void deactivate() {
    controller.dispose();
    super.deactivate();
  }

  @override
  void didUpdateWidget(covariant AppProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_value(oldWidget) != _value()) {
      _createController(oldValue: animation.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: animation.value,
          backgroundColor: context.colorScheme.secondary,
          color: context.colorScheme.primary,
        ),
        AppPadding.extraSmall.spacer,
        _texts,
      ],
    );
  }

  Widget get _texts => Row(
        children: [
          AppText(text: widget.title, style: AppTextStyle.body1),
          AppPadding.normal.expanded(),
          AppText(
            text: '${(animation.value * widget.all).round()}/${widget.all}',
            style: AppTextStyle.body1,
          ),
        ],
      );

  double _value([AppProgressBar? widget]) => (widget ?? this.widget).progress / (widget ?? this.widget).all;
}
