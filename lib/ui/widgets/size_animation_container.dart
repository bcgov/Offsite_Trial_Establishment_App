import 'package:flutter/material.dart';
import 'package:offsite_trial_establishment_app/common/constants/duration.dart';

class SizeAnimationContainer extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const SizeAnimationContainer({
    super.key,
    required this.child,
    this.duration = AnimationDuration.short,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      alignment: Alignment.topCenter,
      child: AnimatedSwitcher(
        duration: duration,
        transitionBuilder: _fadeTransition,
        child: child,
      ),
    );
  }

  Widget _fadeTransition(Widget child, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
